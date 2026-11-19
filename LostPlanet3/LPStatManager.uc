class LPStatManager extends SPSerializableDynamicDataManager
    config(Stats);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MyPC;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MyPRI;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array StatDefinitions[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array OnStatsInitDelegates;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bLoadedFromProfile;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bStatDataInit;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bIsDirty;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array TransientStats[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte MyGameType;
//var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> __OnStatsInit__Delegate;

// Export ULPStatManager::execModifyStat(FFrame&, void* const)
native final simulated function ModifyStat()
{
    local /*0x97E50000-0x00000000*/ private name StatName[8388609];
    local /*0x97E50000-0x00000000*/ private int Amount[9437185];
    local /*0x97E50000-0x00000000*/ private byte ModType[9437185];

    1
    0                    
}

// Export ULPStatManager::execEvalStat(FFrame&, void* const)
native final simulated function EvalStat()
{
    local /*0x97E50000-0x00000000*/ private name StatName[8388609];
    local /*0x97E50000-0x00000000*/ private byte PeriodToEval[9437185];
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];

    2                
}

delegate OnStatsInit()
{
    //return;    
}

// Export ULPStatManager::execGetStat(FFrame&, void* const)
native function GetStat()
{
    local /*0x97E50000-0x00000000*/ private name StatName[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];


}

simulated function SaveStatsToProfile()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL LPPS;
    local /*0x97E50000-0x00000000*/ private int ProfileSettingsID;
    local /*0x97E50000-0x00000000*/ private editfixedsize array StatsSaveData;
    local /*0x97E50000-0x00000000*/ private bool bUsingPlayerStorage;

    // End:0x1FC
    if(bIsDirty)
    {
        // End:0x1E
        if(!bLoadedFromProfile)
        {
            return false;
        }
        // End:0x2F
        if(!bStatDataInit)
        {
            return false;
        }
        // End:0x41
        if((GetMyPlayerController()) == none)
        {
            return false;
        }
        // End:0x67
        if(!MyPC.IsLocalPlayerController())
        {
            return false;
        }
        // End:0x8B
        if(MyPC.IsInPrivateSession())
        {
            return false;
        }
        ProfileSettingsID = 166;
        bUsingPlayerStorage = MyPC.WorldInfo.IsConsoleBuild(1);
        // End:0x143
        if(bUsingPlayerStorage)
        {
            LPPS = LPProfileSettings(MyPC.OnlinePlayerData.StorageProvider.Profile);            
        }
        else
        {
            LPPS = LPProfileSettings(MyPC.ProfileSettings);
        }
        // End:0x185
        if(LPPS == none)
        {
            return false;
        }
        SaveDynamicData(StatsSaveData);
        // End:0x1D0
        if(!LPPS.SetProfileSettingValueBlob(ProfileSettingsID, StatsSaveData))
        {
            return false;
        }
        LPPS.SetModified(true);
        bIsDirty = false;
    }
    return true;
    //return ReturnValue;    
}

simulated function LoadStatsFromProfile()
{
    local /*0x97E50000-0x00000000*/ private bool bForceLoad[9437185], ReturnValue;
    local /*0x97E50000-0x00000000*/ private @NULL LPPS;
    local /*0x97E50000-0x00000000*/ private int ProfileSettingsID;
    local /*0x97E50000-0x00000000*/ private editfixedsize array StatsLoadData;
    local /*0x97E50000-0x00000000*/ private bool bUsingPlayerStorage;

    false
    // End:0x1A8
    if(!bLoadedFromProfile || bForceLoad)
    {
        SerializableContainers.Length = 0;
        // End:0x41
        if((GetMyPlayerController()) == none)
        {
            return false;
        }
        ProfileSettingsID = 166;
        bUsingPlayerStorage = MyPC.WorldInfo.IsConsoleBuild(1);
        // End:0xF9
        if(bUsingPlayerStorage)
        {
            LPPS = LPProfileSettings(MyPC.OnlinePlayerData.StorageProvider.Profile);            
        }
        else
        {
            LPPS = LPProfileSettings(MyPC.ProfileSettings);
        }
        // End:0x13B
        if(LPPS == none)
        {
            return false;
        }
        // End:0x173
        if(!LPPS.GetProfileSettingValueBlob(ProfileSettingsID, StatsLoadData))
        {
            return false;
        }
        LoadDynamicData(StatsLoadData);
        bLoadedFromProfile = true;
        bStatDataInit = false;
        InitStatData();
    }
    return true;
    //return ReturnValue;    
}

final simulated function AddOnStatsInitDelegate()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> OnStatsInitDelegate[8388609];

    // End:0x36
    if(OnStatsInitDelegates.Find(OnStatsInitDelegate) == )
    {        
        OnStatsInitDelegates.AddItem(OnStatsInitDelegate);        
    }
    //return;    
}

final simulated function ClearOnStatsInitDelegate()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> OnStatsInitDelegate[8388609];
    local /*0x97E50000-0x00000000*/ private int RemoveIndex;

    RemoveIndex = OnStatsInitDelegates.Find(OnStatsInitDelegate);    
    // End:0x48
    if(RemoveIndex != -1)
    {
        OnStatsInitDelegates.Remove(RemoveIndex, 1);        
    }
    //return;    
}

final simulated function ClearAllOnStatsInitDelegates()
{
    OnStatsInitDelegates.Length = 0;
    //return;    
}

simulated function AddStatDefinition()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL StatDef[8388609];

    // End:0x46
    if((GetStatDefinitionIndex(StatDef.StatName)) == -1)
    {
        StatDefinitions.AddItem(StatDef);        
    }
    //return;    
}

simulated function InitStatManager()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPPC[8388609];

    MyPC = LPPC;
    MyPRI = LPPRI(LPPC.PlayerReplicationInfo);
    GetGameType(true);
    // End:0x98
    if(MyPC != none)
    {
        // End:0x8E
        if(MyPC.IsLocalPlayerController())
        {
            LoadStatsFromProfile();            
        }
        else
        {
            InitStatData();
        }
    }
    //return;    
}

simulated function InitStatData()
{
    local /*0x97E50000-0x00000000*/ private byte bTransient;
    local /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> StatsInitFunc;
    local /*0x97E50000-0x00000000*/ private @NULL SDDC;
    local /*0x97E50000-0x00000000*/ private class StatClass;
    local /*0x97E50000-0x00000000*/ private editfixedsize string StatClassPath;
    local /*0x97E50000-0x00000000*/ private @NULL Stat;
    local /*0x97E50000-0x00000000*/ private int Idx;

    // End:0x2D9
    if(!bStatDataInit)
    {
        Idx = 0;
        J0x1A:

        // End:0x1D5 [Loop If]
        if(Idx < StatDefinitions.Length)
        {
            // End:0x1C7
            if(ShouldAddStat(StatDefinitions[Idx], bTransient))
            {
                Stat = GetStat(StatDefinitions[Idx].StatName);
                // End:0x19E
                if(Stat == none)
                {
                    StatClassPath = "LostPlanetGame." $ StatDefinitions[Idx].StatClassName;
                    StatClass = class<LPStat>(FindObject(StatClassPath, Class'Core.Class'));
                    StatClass = ((StatClass != none) ? StatClass : Class'LPStat');
                    Stat = new (self) StatClass;
                    // End:0x188
                    if(int(bTransient) > int(0))
                    {
                        TransientStats.AddItem(Stat);                                                
                    }
                    else
                    {
                        SerializableContainers.AddItem(Stat);                        
                    }
                }
                Stat.InitStat(self, Idx);
            }
            Idx++;
            // [Loop Continue]
            goto J0x1A;
        }
        // End:0x26C
        if(StatDefinitions.Length < SerializableContainers.Length)
        {
            // End:0x26B
            foreach SerializableContainers(SDDC)
            {
                Stat = LPStat(SDDC);
                // End:0x26A
                if((GetStatDefinitionIndex(Stat.GetStatName())) == -1)
                {
                    SerializableContainers.RemoveItem(SDDC);                    
                }                
            }            
        }
        bStatDataInit = true;
        Idx = 0;
        J0x283:

        // End:0x2D9 [Loop If]
        if(Idx < OnStatsInitDelegates.Length)
        {
            StatsInitFunc = OnStatsInitDelegates[Idx];
            OnStatsInit();
            Idx++;
            // [Loop Continue]
            goto J0x283;
        }
    }
    //return;    
}

simulated function ShouldAddStat()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL StatDef[8388609];
    local /*0x97E50000-0x00000000*/ private byte bTransient[25165825];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], bIsLocalPlayer, bIsServer, bShouldAdd;

    bIsLocalPlayer = GetMyPlayerController().IsLocalPlayerController();
    bIsServer = int(MyPC.Role) == int(ROLE_Authority);
    bTransient = ((StatDef.bTransient || bIsServer && !bIsLocalPlayer) ? 1 : 0);
    bShouldAdd = (bIsServer && !StatDef.bClientOnly) || bIsLocalPlayer && !StatDef.bServerOnly;
    return bShouldAdd;
    //return ReturnValue;    
}

simulated function ResetStatsForPeriod()
{
    local /*0x97E50000-0x00000000*/ private byte PeriodToReset[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL SDDC, Stat;

    0
    // End:0x46
    foreach TransientStats(Stat)
    {
        Stat.ResetForPeriod(PeriodToReset);        
    }    
    // End:0xA3
    foreach SerializableContainers(SDDC)
    {
        Stat = LPStat(SDDC);
        Stat.ResetForPeriod(PeriodToReset);        
    }    
    //return;    
}

simulated function IncrementStat()
{
    local /*0x97E50000-0x00000000*/ private name StatName[8388609];

    ModifyStat(StatName);
    //return;    
}

simulated function GetStatDefinitionIndex()
{
    local /*0x97E50000-0x00000000*/ private name StatName[8388609];
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];

    // End:0x37
    if(StatName != 'None')
    {
        return StatDefinitions.Find('StatName', StatName);        
    }
    return -1;
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

simulated function GetGameType()
{
    local /*0x97E50000-0x00000000*/ private bool bForceRefresh[9437185];
    local /*0x97E50000-0x00000000*/ private byte ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL MyGRI;

    // End:0xD6
    if((bForceRefresh || int(MyGameType) < int(1)) || int(MyGameType) > int(4))
    {
        MyGRI = LPGRI_Base_MP(Class'Engine.WorldInfo'.static.GetWorldInfo().GRI);
        MyGameType = ((MyGRI != none) ? MyGRI.GameType : 0);
        // End:0xD6
        if(!bForceRefresh)
        {
            ScriptTrace();
        }
    }
    return MyGameType;
    //return ReturnValue;    
}

event GetCurrentGameTypeStatName()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string StatPostfix[8388609];
    local /*0x97E50000-0x00000000*/ private name ReturnValue[92274689];

    return GetGameTypeStatName(StatPostfix, GetGameType());
    //return ReturnValue;    
}

static function GetGameTypeStatName()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string StatPostfix[8388609];
    local /*0x97E50000-0x00000000*/ private byte GameType[8388609];
    local /*0x97E50000-0x00000000*/ private name ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private editfixedsize string Result;

    switch(GameType)
    {
        // End:0x3B
        case 3:
            Result = "Stat_TDM_" $ StatPostfix;
            // End:0xB9
            break;
        // End:0x64
        case 1:
            Result = "Stat_EXTR_" $ StatPostfix;
            // End:0xB9
            break;
        // End:0x8D
        case 2:
            Result = "Stat_SCEN_" $ StatPostfix;
            // End:0xB9
            break;
        // End:0xB6
        case 4:
            Result = "Stat_SURV_" $ StatPostfix;
            // End:0xB9
            break;
        // End:0xFFFF
        default:
            break;
    }
    return name(Result);
    //return ReturnValue;    
}

simulated function LogStatsData()
{
    //return;    
}

simulated function LogStatsProfileData()
{
    //return;    
}

defaultproperties
{
    StatDefinitions=/* Array type was not detected. */
}