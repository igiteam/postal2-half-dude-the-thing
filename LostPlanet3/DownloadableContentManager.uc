class DownloadableContentManager extends Object;

var(*) /*0x35EA0000-0x00000000*/ private array DLCConfigCacheChanges[805437441];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array InstalledDLC[537001985];
var(*) /*0x35EA0000-0x00000000*/ private @NULL NonPackageFilePathMap[805437441];
var(*) /*0x35EA0000-0x00000000*/ private array ClassesToReload[805437441];
var(*) /*0x35EA0000-0x00000000*/ private array ObjectsToReload[805437441];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array QueuedFullyLoadPackageInis[537001985];
var(*) /*0x35EA0000-0x00000000*/ private @NULL GameEngine[537001985];
//var(*) /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> __OnRefreshComplete__Delegate;
//var(*) /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> __OnPreDLCClear__Delegate;
//var(*) /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> __OnPostDLCClear__Delegate;

// Export UDownloadableContentManager::execInstallDLC(FFrame&, void* const)
native function InstallDLC()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize @NULL DLCBundle[25165825];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UDownloadableContentManager::execInstallDLCs(FFrame&, void* const)
native function InstallDLCs()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize array DLCBundles[25165825];


}

// Export UDownloadableContentManager::execClearDLC(FFrame&, void* const)
native function ClearDLC();

// Export UDownloadableContentManager::execGetDLCNonPackageFilePath(FFrame&, void* const)
native function GetDLCNonPackageFilePath()
{
    local /*0x35EA0000-0x00000000*/ private name NonPackageFileName[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize string Path[25165825];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UDownloadableContentManager::execAddSectionToObjectList(FFrame&, void* const)
native function AddSectionToObjectList()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string Section[8388609];


}

// Export UDownloadableContentManager::execMarkPerObjectConfigPendingKill(FFrame&, void* const)
native function MarkPerObjectConfigPendingKill()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string Section[8388609];


}

// Export UDownloadableContentManager::execUpdateObjectLists(FFrame&, void* const)
native function UpdateObjectLists();

// Export UDownloadableContentManager::execInstallPackages(FFrame&, void* const)
protected native function InstallPackages()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize @NULL DLCBundle[25296897];


}

// Export UDownloadableContentManager::execInstallNonPackageFiles(FFrame&, void* const)
protected native function InstallNonPackageFiles()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize @NULL DLCBundle[25296897];


}

// Export UDownloadableContentManager::execActorNotifyPreBeginPlay(FFrame&, void* const)
native function ActorNotifyPreBeginPlay()
{
    local /*0x35EA0000-0x00000000*/ private @NULL TheActor[8388609];


}

// Export UDownloadableContentManager::execActorNotifyPostBeginPlay(FFrame&, void* const)
native function ActorNotifyPostBeginPlay()
{
    local /*0x35EA0000-0x00000000*/ private @NULL TheActor[8388609];


}

// Export UDownloadableContentManager::execActorNotifyDestroyed(FFrame&, void* const)
native function ActorNotifyDestroyed()
{
    local /*0x35EA0000-0x00000000*/ private @NULL TheActor[8388609];


}

// Export UDownloadableContentManager::execActorNotifyBeginDestroy(FFrame&, void* const)
native function ActorNotifyBeginDestroy()
{
    local /*0x35EA0000-0x00000000*/ private @NULL TheActor[8388609];


}

// Export UDownloadableContentManager::execActorNotifyPostLoad(FFrame&, void* const)
native function ActorNotifyPostLoad()
{
    local /*0x35EA0000-0x00000000*/ private @NULL TheActor[8388609];


}

event Init()
{
    local /*0x35EA0000-0x00000000*/ private @NULL OnlineSub;

    OnlineSub = Class'GameEngine'.static.GetOnlineSubsystem();
    // End:0x1AA
    if(OnlineSub != none)
    {
        // End:0xB3
        if(NotEqual_InterfaceInterface(OnlineSub.PlayerInterface, OnlinePlayerInterface(none)))
        {
            OnlineSub.PlayerInterface.AddLoginChangeDelegate(OnLoginChange);
        }
        // End:0x12E
        if(NotEqual_InterfaceInterface(OnlineSub.SystemInterface, OnlineSystemInterface(none)))
        {
            OnlineSub.SystemInterface.AddStorageDeviceChangeDelegate(OnStorageDeviceChange);
        }
        // End:0x1AA
        if(NotEqual_InterfaceInterface(OnlineSub.ContentInterface, OnlineContentInterface(none)))
        {
            OnlineSub.ContentInterface.AddContentChangeDelegate(OnContentChange);
        }
    }
    //return;    
}

function OnLoginChange()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609];

    RefreshDLC();
    //return;    
}

function OnStorageDeviceChange()
{
    RefreshDLC();
    //return;    
}

function OnContentChange()
{
    RefreshDLC();
    //return;    
}

function RefreshDLC()
{
    local /*0x35EA0000-0x00000000*/ private @NULL DLCEnum;

    ClearDLC();
    DLCEnum = Class'GameEngine'.static.GetDLCEnumerator();
    // End:0x92
    if(DLCEnum != none)
    {
        DLCEnum.AddFindDLCDelegate(RefreshDLCEnumComplete);
        DLCEnum.FindDLC();
    }
    //return;    
}

function RefreshDLCEnumComplete()
{
    local /*0x35EA0000-0x00000000*/ private @NULL DLCEnum;

    DLCEnum = Class'GameEngine'.static.GetDLCEnumerator();
    // End:0x87
    if(DLCEnum != none)
    {
        DLCEnum.ClearFindDLCDelegate(RefreshDLCEnumComplete);
        DLCEnum.InstallAllDLC();
    }
    OnRefreshComplete();
    //return;    
}

// Export UDownloadableContentManager::execAddPackagesToFullyLoad(FFrame&, void* const)
native function AddPackagesToFullyLoad()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string Filename[8388609];


}

delegate OnRefreshComplete()
{
    //return;    
}

delegate OnPreDLCClear()
{
    //return;    
}

delegate OnPostDLCClear()
{
    //return;    
}
