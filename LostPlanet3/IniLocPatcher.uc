class IniLocPatcher extends Object
    config(Engine);

struct native IniLocFileEntry
{
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string Filename;
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string DLName;
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string HashCode;
    var(*) /*0x35EA0000-0x00000000*/ private bool bIsUnicode;
    var(*) /*0x35EA0000-0x00000000*/ private byte ReadState;

    structdefaultproperties
    {
        Filename=""
        DLName=""
        HashCode=""
        bIsUnicode=false
        ReadState=EOnlineEnumerationReadState.OERS_NotStarted
    }
};

var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array Files[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private bool bRequestEmsFileList[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private int MaxCachedFileAge[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private @NULL TitleFileInterface[536870913];
var(*) /*0x35EA0000-0x00000000*/ private @NULL TitleFileCacheInterface[536870913];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array ReadTitleFileCompleteDelegates;
//var(*) /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> __OnReadTitleFileComplete__Delegate;
//var(*) /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> __OnAllTitleFilesCompleted__Delegate;

delegate OnReadTitleFileComplete()
{
    local /*0x35EA0000-0x00000000*/ private bool bWasSuccessful[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize string Filename[8388609];

    //return;    
}

delegate OnAllTitleFilesCompleted()
{
    //return;    
}

function Init()
{
    local /*0x35EA0000-0x00000000*/ private @NULL OnlineSub;
    local /*0x35EA0000-0x00000000*/ private int Index;

    OnlineSub = Class'GameEngine'.static.GetOnlineSubsystem();
    // End:0x1B8
    if(OnlineSub != none)
    {
        TitleFileInterface = OnlineSub.TitleFileInterface;
        // End:0xB4
        if(NotEqual_InterfaceInterface(TitleFileInterface, OnlineTitleFileInterface(none)))
        {
            TitleFileInterface.AddReadTitleFileCompleteDelegate(OnDownloadFileComplete);            
        }
        else
        {
            Index = 0;
            J0xBF:

            // End:0x10E [Loop If]
            if(Index < Files.Length)
            {
                Files[Index].ReadState = 3;
                Index++;
                // [Loop Continue]
                goto J0xBF;
            }
        }
        TitleFileCacheInterface = OnlineSub.TitleFileCacheInterface;
        // End:0x1B8
        if(NotEqual_InterfaceInterface(TitleFileCacheInterface, OnlineTitleFileCacheInterface(none)))
        {
            TitleFileCacheInterface.AddLoadTitleFileCompleteDelegate(OnFileCacheLoadComplete);
            TitleFileCacheInterface.AddSaveTitleFileCompleteDelegate(OnFileCacheSaveComplete);
        }
    }
    //return;    
}

function DownloadFiles()
{
    local /*0x35EA0000-0x00000000*/ private int FileIdx;

    // End:0xBD
    if(bRequestEmsFileList)
    {
        // End:0x69
        if((MaxCachedFileAge > 0) && NotEqual_InterfaceInterface(TitleFileCacheInterface, OnlineTitleFileCacheInterface(none)))
        {
            TitleFileCacheInterface.DeleteTitleFiles(float(MaxCachedFileAge));
        }
        TitleFileInterface.AddRequestTitleFileListCompleteDelegate(OnRequestTitleFileListComplete);
        TitleFileInterface.RequestTitleFileList();        
    }
    else
    {
        FileIdx = 0;
        J0xC8:

        // End:0x13B [Loop If]
        if(FileIdx < Files.Length)
        {
            Files[FileIdx].DLName = Files[FileIdx].Filename;
            FileIdx++;
            // [Loop Continue]
            goto J0xC8;
        }
        StartLoadingFiles();
    }
    //return;    
}

function OnRequestTitleFileListComplete()
{
    local /*0x35EA0000-0x00000000*/ private bool bWasSuccessful[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize string ResultStr[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL Root;
    local /*0x35EA0000-0x00000000*/ private int JsonObjectIdx;
    local /*0x35EA0000-0x00000000*/ private editfixedsize @NULL RequestFileEntry;

    TitleFileInterface.ClearRequestTitleFileListCompleteDelegate(OnRequestTitleFileListComplete);
    // End:0x2A6
    if(bWasSuccessful)
    {
        Root = Class'JsonObject'.static.DecodeJson(ResultStr);
        // End:0x2A3
        if(Root != none)
        {
            Files.Length = 0;
            JsonObjectIdx = 0;
            J0x96:

            // End:0x296 [Loop If]
            if(JsonObjectIdx < Root.ObjectArray.Length)
            {
                RequestFileEntry.Filename = Root.ObjectArray[JsonObjectIdx].GetStringValue("file_name");
                RequestFileEntry.DLName = Root.ObjectArray[JsonObjectIdx].GetStringValue("dl_name");
                RequestFileEntry.HashCode = Root.ObjectArray[JsonObjectIdx].GetStringValue("hash_code");
                RequestFileEntry.bIsUnicode = (InStr(RequestFileEntry.Filename, ".ini",, true) == -1) && InStr(RequestFileEntry.Filename, ".int",, true) == -1;
                Files.AddItem(RequestFileEntry);                
                JsonObjectIdx++;
                // [Loop Continue]
                goto J0x96;
            }
            StartLoadingFiles();            
        }        
    }
    //return;    
}

function StartLoadingFiles()
{
    local /*0x35EA0000-0x00000000*/ private int Index;

    // End:0x130
    if(bRequestEmsFileList)
    {
        // End:0x12D
        if(NotEqual_InterfaceInterface(TitleFileCacheInterface, OnlineTitleFileCacheInterface(none)))
        {
            Index = 0;
            J0x38:

            // End:0x12D [Loop If]
            if(Index < Files.Length)
            {
                // End:0x11F
                if(int(Files[Index].ReadState) == int(0))
                {
                    // End:0xF6
                    if(TitleFileCacheInterface.LoadTitleFile(Files[Index].DLName))
                    {
                        Files[Index].ReadState = 1;                        
                    }
                    else
                    {
                        Files[Index].ReadState = 3;
                    }
                }
                Index++;
                // [Loop Continue]
                goto J0x38;
            }
        }        
    }
    else
    {
        // End:0x2A7
        if(NotEqual_InterfaceInterface(TitleFileInterface, OnlineTitleFileInterface(none)))
        {
            Index = 0;
            J0x15B:

            // End:0x2A7 [Loop If]
            if(Index < Files.Length)
            {
                // End:0x299
                if(int(Files[Index].ReadState) == int(0))
                {
                    Files[Index].Filename = UpdateLocFileName(Files[Index].Filename);
                    // End:0x270
                    if(TitleFileInterface.ReadTitleFile(Files[Index].DLName))
                    {
                        Files[Index].ReadState = 1;                        
                    }
                    else
                    {
                        Files[Index].ReadState = 3;
                    }
                }
                Index++;
                // [Loop Continue]
                goto J0x15B;
            }
        }
    }
    //return;    
}

function OnDownloadFileComplete()
{
    local /*0x35EA0000-0x00000000*/ private bool bWasSuccessful[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize string Filename[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bSuccessLoad;
    local /*0x35EA0000-0x00000000*/ private int Index;
    local /*0x35EA0000-0x00000000*/ private editfixedsize array FileData;

    Index = 0;
    J0x0B:

    // End:0x276 [Loop If]
    if(Index < Files.Length)
    {
        // End:0x268
        if(Files[Index].DLName == Filename)
        {
            // End:0x23C
            if(bWasSuccessful)
            {
                // End:0x210
                if(TitleFileInterface.GetTitleFileContents(Filename, FileData) && FileData.Length > 0)
                {
                    bSuccessLoad = true;
                    Files[Index].ReadState = 2;
                    // End:0x184
                    if(bRequestEmsFileList && NotEqual_InterfaceInterface(TitleFileCacheInterface, OnlineTitleFileCacheInterface(none)))
                    {
                        TitleFileCacheInterface.SaveTitleFile(Files[Index].DLName, Files[Index].Filename, FileData);
                    }
                    TitleFileInterface.ClearDownloadedFile(Filename);
                    ProcessIniLocFile(Files[Index].Filename, Files[Index].bIsUnicode, FileData);                    
                }
                else
                {
                    Files[Index].ReadState = 3;
                }                
            }
            else
            {
                Files[Index].ReadState = 3;
            }
            // [Explicit Break]
            goto J0x276;
        }
        Index++;
        // [Loop Continue]
        goto J0x0B;
    }
    J0x276:

    TriggerDownloadCompleteDelegates(bSuccessLoad, Filename);
    //return;    
}

function OnFileCacheLoadComplete()
{
    local /*0x35EA0000-0x00000000*/ private bool bWasSuccessful[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize string Filename[8388609];
    local /*0x35EA0000-0x00000000*/ private int Index;
    local /*0x35EA0000-0x00000000*/ private editfixedsize array FileData;
    local /*0x35EA0000-0x00000000*/ private bool bRequiresDownload;

    bRequiresDownload = true;
    Index = 0;
    J0x17:

    // End:0x1DD [Loop If]
    if(Index < Files.Length)
    {
        // End:0x1CF
        if(Files[Index].DLName == Filename)
        {
            // End:0x1CC
            if(bWasSuccessful)
            {
                // End:0x1CC
                if(TitleFileCacheInterface.GetTitleFileHash(Filename) == Files[Index].HashCode)
                {
                    // End:0x1C9
                    if(TitleFileCacheInterface.GetTitleFileContents(Filename, FileData) && FileData.Length > 0)
                    {
                        Files[Index].ReadState = 2;
                        bRequiresDownload = false;
                        ProcessIniLocFile(Files[Index].Filename, Files[Index].bIsUnicode, FileData);
                        TitleFileCacheInterface.ClearCachedFile(Filename);
                    }                    
                }
            }
            // [Explicit Break]
            goto J0x1DD;
        }
        Index++;
        // [Loop Continue]
        goto J0x17;
    }
    J0x1DD:

    // End:0x2B9
    if(bRequiresDownload)
    {
        TitleFileCacheInterface.DeleteTitleFile(Filename);
        // End:0x28D
        if(NotEqual_InterfaceInterface(TitleFileInterface, OnlineTitleFileInterface(none)) && TitleFileInterface.ReadTitleFile(Filename))
        {
            Files[Index].ReadState = 1;            
        }
        else
        {
            Files[Index].ReadState = 3;
        }        
    }
    else
    {
        TriggerDownloadCompleteDelegates(true, Filename);
    }
    //return;    
}

function OnFileCacheSaveComplete()
{
    local /*0x35EA0000-0x00000000*/ private bool bWasSuccessful[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize string Filename[8388609];

    TitleFileCacheInterface.ClearCachedFile(Filename);
    //return;    
}

function TriggerDownloadCompleteDelegates()
{
    local /*0x35EA0000-0x00000000*/ private bool bSuccess[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize string Filename[8388609];
    local /*0x35EA0000-0x00000000*/ private int Index;
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> OnReadTitleFileComplete;

    Index = 0;
    J0x0B:

    // End:0x8D [Loop If]
    if(Index < ReadTitleFileCompleteDelegates.Length)
    {
        // End:0x7F
        if(ReadTitleFileCompleteDelegates[Index] != none)
        {
            OnReadTitleFileComplete = ReadTitleFileCompleteDelegates[Index];
            OnReadTitleFileComplete(bSuccess, Filename);
        }
        Index++;
        // [Loop Continue]
        goto J0x0B;
    }
    CheckForAllFilesComplete();
    //return;    
}

function CheckForAllFilesComplete()
{
    local /*0x35EA0000-0x00000000*/ private int Index;
    local /*0x35EA0000-0x00000000*/ private bool bAllFilesComplete;

    bAllFilesComplete = true;
    Index = 0;
    J0x17:

    // End:0xAD [Loop If]
    if(Index < Files.Length)
    {
        // End:0x9F
        if((int(Files[Index].ReadState) == int(0)) || int(Files[Index].ReadState) == int(1))
        {
            bAllFilesComplete = false;
        }
        Index++;
        // [Loop Continue]
        goto J0x17;
    }
    // End:0xCD
    if(bAllFilesComplete)
    {
        OnAllTitleFilesCompleted();
    }
    //return;    
}

// Export UIniLocPatcher::execProcessIniLocFile(FFrame&, void* const)
native function ProcessIniLocFile()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string Filename[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bIsUnicode[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize array FileData[25296897];


}

function AddFileToDownload()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string Filename[8388609];
    local /*0x35EA0000-0x00000000*/ private int FileIndex;

    FileIndex = Files.Find('Filename', Filename);    
    // End:0x12D
    if(FileIndex == -1)
    {
        FileIndex = Files.Length;
        Files.Length = FileIndex + 1;
        Files[FileIndex].Filename = Filename;
        Files[FileIndex].DLName = Filename;
        Files[FileIndex].bIsUnicode = (InStr(Filename, ".ini",, true) == -1) && InStr(Filename, ".int",, true) == -1;        
    }
    else
    {
        Files[FileIndex].ReadState = 0;
    }
    DownloadFiles();
    //return;    
}

function AddReadFileDelegate()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> ReadTitleFileCompleteDelegate[8388609];

    // End:0x47
    if(ReadTitleFileCompleteDelegate != none && ReadTitleFileCompleteDelegates.Find(ReadTitleFileCompleteDelegate) == )
    {        
        ReadTitleFileCompleteDelegates.AddItem(ReadTitleFileCompleteDelegate);        
    }
    //return;    
}

function ClearReadFileDelegate()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> ReadTitleFileCompleteDelegate[8388609];
    local /*0x35EA0000-0x00000000*/ private int RemoveIndex;

    RemoveIndex = ReadTitleFileCompleteDelegates.Find(ReadTitleFileCompleteDelegate);    
    // End:0x48
    if(RemoveIndex != -1)
    {
        ReadTitleFileCompleteDelegates.Remove(RemoveIndex, 1);        
    }
    //return;    
}

function ClearCachedFiles()
{
    local /*0x35EA0000-0x00000000*/ private int Index;

    Index = 0;
    J0x0B:

    // End:0x5A [Loop If]
    if(Index < Files.Length)
    {
        Files[Index].ReadState = 0;
        Index++;
        // [Loop Continue]
        goto J0x0B;
    }
    // End:0x9A
    if(NotEqual_InterfaceInterface(TitleFileInterface, OnlineTitleFileInterface(none)))
    {
        TitleFileInterface.ClearDownloadedFiles();
    }
    // End:0xDA
    if(NotEqual_InterfaceInterface(TitleFileCacheInterface, OnlineTitleFileCacheInterface(none)))
    {
        TitleFileCacheInterface.ClearCachedFiles();
    }
    //return;    
}

// Export UIniLocPatcher::execUpdateLocFileName(FFrame&, void* const)
native function UpdateLocFileName()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string Filename[8388609], ReturnValue;


}
