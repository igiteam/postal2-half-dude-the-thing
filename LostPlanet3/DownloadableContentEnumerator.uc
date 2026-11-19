class DownloadableContentEnumerator extends Object;

var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array DLCBundles;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string DLCRootDir[131073];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array DLCDirectoryBundles;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string DevDLCRootDir[131073];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array FindDLCDirectoryDelegates;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array FindDLCDelegates;
//var(*) /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> __OnFindDLCComplete__Delegate;

// Export UDownloadableContentEnumerator::execFindDLC(FFrame&, void* const)
native function FindDLC()
{
    local /*0x35EA0000-0x00000000*/ private bool bDirectoriesOnly[9437185];


}

delegate OnFindDLCComplete()
{
    //return;    
}

function AddFindDLCDelegate()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> InDelegate[8388609];

    // End:0x36
    if(FindDLCDelegates.Find(InDelegate) == )
    {        
        FindDLCDelegates.AddItem(InDelegate);        
    }
    //return;    
}

function ClearFindDLCDelegate()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> InDelegate[8388609];
    local /*0x35EA0000-0x00000000*/ private int RemoveIndex;

    RemoveIndex = FindDLCDelegates.Find(InDelegate);    
    // End:0x48
    if(RemoveIndex != -1)
    {
        FindDLCDelegates.Remove(RemoveIndex, 1);        
    }
    //return;    
}

function AddFindDLCDirectoryDelegate()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> InDelegate[8388609];

    // End:0x36
    if(FindDLCDirectoryDelegates.Find(InDelegate) == )
    {        
        FindDLCDirectoryDelegates.AddItem(InDelegate);        
    }
    //return;    
}

function ClearFindDLCDirectoryDelegate()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> InDelegate[8388609];
    local /*0x35EA0000-0x00000000*/ private int RemoveIndex;

    RemoveIndex = FindDLCDirectoryDelegates.Find(InDelegate);    
    // End:0x48
    if(RemoveIndex != -1)
    {
        FindDLCDirectoryDelegates.Remove(RemoveIndex, 1);        
    }
    //return;    
}

// Export UDownloadableContentEnumerator::execTriggerFindDLCDirectoryDelegates(FFrame&, void* const)
native function TriggerFindDLCDirectoryDelegates();

// Export UDownloadableContentEnumerator::execDeleteDLC(FFrame&, void* const)
native function DeleteDLC()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string DLCName[8388609];


}

function InstallAllDLC()
{
    local /*0x35EA0000-0x00000000*/ private @NULL DLCManager;

    DLCManager = Class'GameEngine'.static.GetDLCManager();
    // End:0x60
    if(DLCManager != none)
    {
        DLCManager.InstallDLCs(DLCBundles);
    }
    //return;    
}

// Export UDownloadableContentEnumerator::execInstallDLC(FFrame&, void* const)
native function InstallDLC()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string DLCName[8388609];


}

// Export UDownloadableContentEnumerator::execTriggerFindDLCDelegates(FFrame&, void* const)
native function TriggerFindDLCDelegates();

defaultproperties
{
    DLCRootDir="../../DLC/"
}