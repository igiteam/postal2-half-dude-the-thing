class LPMetagameManager extends LPUnlockableManager;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL StatManager[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int CachedRank;

// Export ULPMetagameManager::execNotifyCreditsChanged(FFrame&, void* const)
native final simulated function NotifyCreditsChanged()
{
    local /*0x97E50000-0x00000000*/ private int CurrentCredits[8388609], PrevCredits;


}

// Export ULPMetagameManager::execGetMetagameData(FFrame&, void* const)
native final simulated function GetMetagameData()
{
    local /*0x97E50000-0x00000000*/ private name UnlockName[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export ULPMetagameManager::execGetUnlockProgressForCell(FFrame&, void* const)
native final simulated function GetUnlockProgressForCell()
{
    local /*0x97E50000-0x00000000*/ private @NULL InCell[25296897];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];


}

// Export ULPMetagameManager::execUnlockStatRequirementsMetForCell(FFrame&, void* const)
native final simulated function UnlockStatRequirementsMetForCell()
{
    local /*0x97E50000-0x00000000*/ private @NULL InCell[25296897];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

simulated function InitUnlockables()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPPC[8388609];
    local /*0x97E50000-0x00000000*/ private bool bNoProfileLoad[9437185];

    MyPC = LPPC;
    MyPRI = LPPRI(MyPC.PlayerReplicationInfo);
    bIsLocallyOwned = LPPC.IsLocalPlayerController();
    StatManager = LPPC.GetStatManager();
    // End:0xB2
    if(bNoProfileLoad)
    {
        InitUnlockableData();        
    }
    else
    {
        LoadUnlockablesFromProfile();
    }
    SPDownloadableContentManager(Class'Engine.GameEngine'.static.GetDLCManager()).ProcessDLCNotification("MetagameManagerInit", self, LPPC);
    //return;    
}

simulated function InitUnlockableData()
{
    local /*0x97E50000-0x00000000*/ private @NULL Unlockable, Stat;
    local /*0x97E50000-0x00000000*/ private int Idx;

    super.InitUnlockableData();
    Idx = 0;
    J0x15:

    // End:0x2C6 [Loop If]
    if(Idx < Class'LPMetagameDefinitions'.default.Cells.Length)
    {
        Unlockable = LPMetagameData(GetUnlockable(Class'LPMetagameDefinitions'.default.Cells[Idx].CellName));
        // End:0x189
        if(Unlockable == none)
        {
            Unlockable = new (self) Class'LPMetagameData';
            Unlockable.SetUnlockName(Class'LPMetagameDefinitions'.default.Cells[Idx].CellName);
            Unlockable.SetUnlockStatus(Class'LPMetagameDefinitions'.default.Cells[Idx].bInitiallyUnlocked);
            AddUnlockable(Unlockable);
        }
        Unlockable.MetagameIndex = Idx;
        Unlockable.MetagameManager = self;
        // End:0x2B8
        if(bIsLocallyOwned)
        {
            // End:0x2B8
            if(Unlockable.IsTracked())
            {
                Stat = StatManager.GetStat(Class'LPMetagameDefinitions'.default.Cells[Idx].UnlockStat);
                // End:0x2B8
                if(Stat != none)
                {
                    Stat.AddOnStatModifiedDelegate(Unlockable.OnStatModified);
                }
            }
        }
        Idx++;
        // [Loop Continue]
        goto J0x15;
    }
    // End:0x39E
    if(Class'LPMetagameDefinitions'.default.Cells.Length < SerializableContainers.Length)
    {
        Idx = 0;
        J0x2FF:

        // End:0x39E [Loop If]
        if(Idx < SerializableContainers.Length)
        {
            Unlockable = LPMetagameData(SerializableContainers[Idx]);
            // End:0x390
            if((GetCellIndex(Unlockable.GetUnlockName())) == -1)
            {
                SerializableContainers.RemoveItem(SerializableContainers[Idx]);                
            }
            Idx++;
            // [Loop Continue]
            goto J0x2FF;
        }
    }
    //return;    
}

simulated function SaveUnlockablesToProfile()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], Retval;

    SPDownloadableContentManager(Class'Engine.GameEngine'.static.GetDLCManager()).ProcessDLCNotification("MetagameManagerSave", self, MyPC);
    Retval = super.SaveUnlockablesToProfile();
    return Retval;
    //return ReturnValue;    
}

simulated function LoadUnlockablesFromProfile()
{
    local /*0x97E50000-0x00000000*/ private bool bForceLoad[9437185], ReturnValue, bResult;

    false
    bResult = super.LoadUnlockablesFromProfile(bForceLoad);
    SPDownloadableContentManager(Class'Engine.GameEngine'.static.GetDLCManager()).ProcessDLCNotification("MetagameManagerLoad", self, MyPC);
    return bResult;
    //return ReturnValue;    
}

simulated function SetMetagameData()
{
    local /*0x97E50000-0x00000000*/ private name UnlockName[8388609];
    local /*0x97E50000-0x00000000*/ private bool bIsUnlocked[8388609], bIsTracked;
    local /*0x97E50000-0x00000000*/ private @NULL MetagameData;

    SetUnlockable(UnlockName, bIsUnlocked);
    MetagameData = GetMetagameData(UnlockName);
    MetagameData.SetTrackingStatus(bIsTracked);
    //return;    
}

simulated function GetCellIndex()
{
    local /*0x97E50000-0x00000000*/ private name CellName[8388609];
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];

    return Class'LPMetagameDefinitions'.default.Cells.Find('CellName', CellName);    
    //return ReturnValue;    
}

simulated function SetUnlockStatus()
{
    local /*0x97E50000-0x00000000*/ private name UnlockName[8388609];
    local /*0x97E50000-0x00000000*/ private bool bUnlocked[8388609], bNoStatUpdate;

    super.SetUnlockStatus(UnlockName, bUnlocked, bNoStatUpdate);
    CachedRank = -1;
    // End:0x7A
    if(!bNoStatUpdate)
    {
        StatManager.ModifyStat('Stat_MetagameUnlocks', GetPlayerUnlockCount(), 1);
    }
    //return;    
}

simulated function SetUnlockStatusByType()
{
    local /*0x97E50000-0x00000000*/ private name RewardType[8388609];
    local /*0x97E50000-0x00000000*/ private bool bUnlocked[8388609], bNoStatUpdate;
    local /*0x97E50000-0x00000000*/ private @NULL C;

    // End:0x92
    foreach Class'LPMetagameDefinitions'.default.Cells(C)
    {
        // End:0x91
        if(C.RewardType == RewardType)
        {
            SetUnlockStatus(C.CellName, bUnlocked, bNoStatUpdate);
        }        
    }    
    //return;    
}

simulated function GetCellByName()
{
    local /*0x97E50000-0x00000000*/ private name CellName[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    return GetCellByIndex(GetCellIndex(CellName));
    //return ReturnValue;    
}

simulated function GetCellByLocation()
{
    local /*0x97E50000-0x00000000*/ private int X[8388609], Y;
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private int Idx;
    local /*0x97E50000-0x00000000*/ private @NULL EmptyCell;

    Idx = 0;
    J0x0B:

    // End:0x103 [Loop If]
    if(Idx < Class'LPMetagameDefinitions'.default.Cells.Length)
    {
        // End:0xF5
        if((X == Class'LPMetagameDefinitions'.default.Cells[Idx].CellX) && Y == Class'LPMetagameDefinitions'.default.Cells[Idx].CellY)
        {
            return Class'LPMetagameDefinitions'.default.Cells[Idx];
        }
        Idx++;
        // [Loop Continue]
        goto J0x0B;
    }
    return EmptyCell;
    //return ReturnValue;    
}

simulated function GetCellByIndex()
{
    local /*0x97E50000-0x00000000*/ private int Idx[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], EmptyCell;

    // End:0x67
    if((Idx >= 0) && Idx < Class'LPMetagameDefinitions'.default.Cells.Length)
    {
        return Class'LPMetagameDefinitions'.default.Cells[Idx];
    }
    return EmptyCell;
    //return ReturnValue;    
}

simulated function IsTracked()
{
    local /*0x97E50000-0x00000000*/ private name UnlockName[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL UnlockableToCheck;

    // End:0x63
    if(UnlockName != 'None')
    {
        UnlockableToCheck = GetMetagameData(UnlockName);
        // End:0x63
        if(UnlockableToCheck != none)
        {
            return UnlockableToCheck.super(LPMetagameManager).IsTracked();
        }
    }
    return false;
    //return ReturnValue;    
}

simulated function SetTrackingStatus()
{
    local /*0x97E50000-0x00000000*/ private name UnlockName[8388609];
    local /*0x97E50000-0x00000000*/ private bool bTracked[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL UnlockableToTrack;

    UnlockableToTrack = GetMetagameData(UnlockName);
    // End:0x2E
    if(UnlockableToTrack == none)
    {
        return;
    }
    UnlockableToTrack.SetTrackingStatus(bTracked);
    bIsDirty = true;
    //return;    
}

simulated function GetUnlockProgress()
{
    local /*0x97E50000-0x00000000*/ private name UnlockName[8388609];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private int CellIndex;
    local /*0x97E50000-0x00000000*/ private @NULL Cell;

    CellIndex = GetCellIndex(UnlockName);
    // End:0x5D
    if(CellIndex >= 0)
    {
        Cell = GetCellByIndex(CellIndex);
        return GetUnlockProgressForCell(Cell);
    }
    return 0.0000000;
    //return ReturnValue;    
}

simulated function UnlockStatRequirementsMet()
{
    local /*0x97E50000-0x00000000*/ private name UnlockName[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private int CellIndex;
    local /*0x97E50000-0x00000000*/ private @NULL Cell;

    CellIndex = GetCellIndex(UnlockName);
    // End:0x5D
    if(CellIndex >= 0)
    {
        Cell = GetCellByIndex(CellIndex);
        return UnlockStatRequirementsMetForCell(Cell);
    }
    return false;
    //return ReturnValue;    
}

simulated function ShouldReplicate()
{
    local /*0x97E50000-0x00000000*/ private @NULL Cell[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x22
    if(Cell.bForceReplicate)
    {
        return true;
    }
    // End:0x6A
    if(Class'LPMetagameDefinitions'.default.RewardTypesToReplicate.Find(string(Cell.RewardType)) >= )
    {        
        return true;
    }
    return false;
    //return ReturnValue;    
}

simulated function GetMetagameRank()
{
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];

    // End:0x25
    if(CachedRank < 0)
    {
        CachedRank = Round(GetPlayerUnlockPercent());
    }
    return CachedRank;
    //return ReturnValue;    
}

simulated function GetPlayerUnlockProgress()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private int UnlockableCount;

    UnlockableCount = GetPlayerUnlockableCount();
    return ((UnlockableCount > 0) ? float(GetPlayerUnlockCount()) / float(UnlockableCount) : 1.0000000);
    //return ReturnValue;    
}

simulated function GetPlayerUnlockPercent()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return (GetPlayerUnlockProgress()) * 100.0000000;
    //return ReturnValue;    
}

simulated function GetPlayerUnlockCount()
{
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689], PlayerUnlockCount, Idx;

    PlayerUnlockCount = 0;
    Idx = 0;
    J0x16:

    // End:0x12C [Loop If]
    if(Idx < Class'LPMetagameDefinitions'.default.Cells.Length)
    {
        // End:0x11E
        if(!Class'LPMetagameDefinitions'.default.Cells[Idx].bInitiallyUnlocked && !Class'LPMetagameDefinitions'.default.Cells[Idx].bNoDisplayCell)
        {
            PlayerUnlockCount += ((IsUnlocked(Class'LPMetagameDefinitions'.default.Cells[Idx].CellName)) ? 1 : 0);
        }
        Idx++;
        // [Loop Continue]
        goto J0x16;
    }
    return PlayerUnlockCount;
    //return ReturnValue;    
}

simulated function GetPlayerUnlockableCount()
{
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689], PlayerUnlockableCount, Idx;

    PlayerUnlockableCount = 0;
    Idx = 0;
    J0x16:

    // End:0xE0 [Loop If]
    if(Idx < Class'LPMetagameDefinitions'.default.Cells.Length)
    {
        // End:0xD2
        if(!Class'LPMetagameDefinitions'.default.Cells[Idx].bInitiallyUnlocked && !Class'LPMetagameDefinitions'.default.Cells[Idx].bNoDisplayCell)
        {
            PlayerUnlockableCount++;
        }
        Idx++;
        // [Loop Continue]
        goto J0x16;
    }
    return PlayerUnlockableCount;
    //return ReturnValue;    
}

simulated function LogUnlockables()
{
    //return;    
}

defaultproperties
{
    CachedRank=-1
    UnlockableClass=Class'LPMetagameData'
}