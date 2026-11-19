class LPUnlockableManager extends SPSerializableDynamicDataManager;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MyPC;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MyPRI;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bIsLocallyOwned;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bLoadedFromProfile;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bUpdatedFromProfile;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bUnlockedAll;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bIsDirty;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private class UnlockableClass;

// Export ULPUnlockableManager::execGetUnlockable(FFrame&, void* const)
native simulated function GetUnlockable()
{
    local /*0x97E50000-0x00000000*/ private name UnlockName[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export ULPUnlockableManager::execIsUnlocked(FFrame&, void* const)
native simulated function IsUnlocked()
{
    local /*0x97E50000-0x00000000*/ private name UnlockName[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export ULPUnlockableManager::execGetPC(FFrame&, void* const)
native simulated function GetPC()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];


}

simulated function InitUnlockables()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPPC[8388609];
    local /*0x97E50000-0x00000000*/ private bool bNoProfileLoad[9437185];

    MyPC = LPPC;
    MyPRI = LPPRI(MyPC.PlayerReplicationInfo);
    bIsLocallyOwned = LPPC.IsLocalPlayerController();
    // End:0x89
    if(bNoProfileLoad)
    {
        InitUnlockableData();        
    }
    else
    {
        LoadUnlockablesFromProfile();
    }
    //return;    
}

simulated function SetUnlockable()
{
    local /*0x97E50000-0x00000000*/ private name UnlockName[8388609];
    local /*0x97E50000-0x00000000*/ private bool bIsUnlocked[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL Unlockable;

    Unlockable = GetUnlockable(UnlockName);
    // End:0x7F
    if(Unlockable == none)
    {
        Unlockable = new (self) UnlockableClass;
        Unlockable.SetUnlockName(UnlockName);
        AddUnlockable(Unlockable);
    }
    Unlockable.SetUnlockStatus(bIsUnlocked);
    //return;    
}

simulated function SaveUnlockablesToProfile()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL LPPS;
    local /*0x97E50000-0x00000000*/ private int ProfileSettingsID;
    local /*0x97E50000-0x00000000*/ private editfixedsize array UnlockSaveData;

    // End:0xE4
    if(bIsDirty)
    {
        // End:0x1F
        if((GetMyPlayerController()) == none)
        {
            return false;
        }
        LPPS = LPProfileSettings(MyPC.ProfileSettings);
        // End:0x61
        if(LPPS == none)
        {
            return false;
        }
        SaveDynamicData(UnlockSaveData);
        ProfileSettingsID = 167;
        // End:0xB8
        if(!LPPS.SetProfileSettingValueBlob(ProfileSettingsID, UnlockSaveData))
        {
            return false;
        }
        LPPS.SetModified(true);
        bIsDirty = false;
    }
    return true;
    //return ReturnValue;    
}

simulated function LoadUnlockablesFromProfile()
{
    local /*0x97E50000-0x00000000*/ private bool bForceLoad[9437185], ReturnValue;
    local /*0x97E50000-0x00000000*/ private @NULL LPPS;
    local /*0x97E50000-0x00000000*/ private int ProfileSettingsID;
    local /*0x97E50000-0x00000000*/ private editfixedsize array UnlockLoadData;

    false
    // End:0x1B9
    if(!bLoadedFromProfile || bForceLoad)
    {
        SerializableContainers.Length = 0;
        // End:0x41
        if((GetMyPlayerController()) == none)
        {
            return false;
        }
        // End:0xFE
        if((int(MyPC.OnlineSub.PlayerInterface.GetLoginStatus(byte(LocalPlayer(MyPC.Player).ControllerId))) != int(2)) && !Class'Engine.WorldInfo'.static.IsConsoleBuild(2))
        {
            return false;
        }
        LPPS = LPProfileSettings(MyPC.ProfileSettings);
        // End:0x140
        if(LPPS == none)
        {
            return false;
        }
        ProfileSettingsID = 167;
        // End:0x184
        if(!LPPS.GetProfileSettingValueBlob(ProfileSettingsID, UnlockLoadData))
        {
            return false;
        }
        LoadDynamicData(UnlockLoadData);
        InitUnlockableData();
        bLoadedFromProfile = true;
        bUpdatedFromProfile = true;
    }
    return true;
    //return ReturnValue;    
}

simulated function InitUnlockableData()
{
    //return;    
}

simulated function AddUnlockable()
{
    local /*0x97E50000-0x00000000*/ private @NULL Unlockable[8388609];

    SerializableContainers.AddItem(Unlockable);    
    //return;    
}

simulated function SetUnlockStatus()
{
    local /*0x97E50000-0x00000000*/ private name UnlockName[8388609];
    local /*0x97E50000-0x00000000*/ private bool bUnlocked[8388609], bNoStatUpdate;
    local /*0x97E50000-0x00000000*/ private @NULL UnlockableToUnlock;

    UnlockableToUnlock = GetUnlockable(UnlockName);
    // End:0x2F
    if(UnlockableToUnlock == none)
    {
        return;
    }
    UnlockableToUnlock.SetUnlockStatus(bUnlocked);
    bIsDirty = true;
    //return;    
}

simulated function UnlockAll()
{
    local /*0x97E50000-0x00000000*/ private @NULL SDDC;

    bUnlockedAll = true;
    // End:0x58
    foreach SerializableContainers(SDDC)
    {
        SetUnlockStatus(LPUnlockable(SDDC).GetUnlockName(), true);        
    }    
    //return;    
}

simulated function LockAll()
{
    local /*0x97E50000-0x00000000*/ private @NULL SDDC;

    bUnlockedAll = false;
    // End:0x58
    foreach SerializableContainers(SDDC)
    {
        SetUnlockStatus(LPUnlockable(SDDC).GetUnlockName(), false);        
    }    
    //return;    
}

simulated function GetOverallUnlockProgress()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL SDDC;
    local /*0x97E50000-0x00000000*/ private int Count, UnlockedCount;

    // End:0x59
    foreach SerializableContainers(SDDC)
    {
        Count++;
        // End:0x58
        if(LPUnlockable(SDDC).IsUnlocked())
        {
            UnlockedCount++;
        }        
    }    
    // End:0x75
    if(Count == 0)
    {
        return float(Count);
    }
    return float(UnlockedCount) / float(Count);
    //return ReturnValue;    
}

simulated function GetOverallUnlockCount()
{
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL SDDC;
    local /*0x97E50000-0x00000000*/ private int UnlockedCount;

    // End:0x4E
    foreach SerializableContainers(SDDC)
    {
        // End:0x4D
        if(LPUnlockable(SDDC).IsUnlocked())
        {
            UnlockedCount++;
        }        
    }    
    return UnlockedCount;
    //return ReturnValue;    
}

function GetMyPlayerController()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    // End:0x5E
    if(MyPC == none)
    {
        // End:0x4F
        if(MyPRI != none)
        {
            MyPC = LPPlayerController(MyPRI.Owner);
        }
        // End:0x5E
        if(MyPC == none)
        {
        }
    }
    return MyPC;
    //return ReturnValue;    
}

simulated function LogUnlockables()
{
    //return;    
}

defaultproperties
{
    UnlockableClass=Class'LPUnlockable'
}