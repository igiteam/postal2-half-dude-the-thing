class LPAchievementManager extends Object
    config(Game);

struct AchievementInfo
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private name AchievementName;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private int AchievementIndex;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private int TrophyIndex;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private name StatName;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte StatPeriod;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string StatMapName;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private int Value;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private int UnlockValue;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool Unlocked;

    structdefaultproperties
    {
        AchievementName="None"
        AchievementIndex=0
        TrophyIndex=0
        StatName="None"
        StatPeriod=eStatPeriod.StatPeriod_Persistent
        StatMapName=""
        Value=0
        UnlockValue=0
        Unlocked=false
    }
};

var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array AchievementInfos[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MyPC[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MyPRI;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool Enabled[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bIsDirty;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bLoadedFromProfile;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bIsPS3;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL StatManager;

function InitAchievements()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPPC[8388609];

    MyPC = LPPC;
    MyPRI = LPPRI(LPPC.PlayerReplicationInfo);
    StatManager = LPPC.GetStatManager();
    StatManager.AddOnStatsInitDelegate(AddStatModifiedDelegates);
    bIsPS3 = Class'Engine.WorldInfo'.static.IsConsoleBuild(2);
    //return;    
}

function SaveAchievementsToProfile()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

function LoadAchievementsFromProfile()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

function CreateCheckpointRecord()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL Record[25165825];
    local /*0x97E50000-0x00000000*/ private editfixedsize array AchievementData;
    local /*0x97E50000-0x00000000*/ private int I;

    I = 0;
    J0x0B:

    // End:0x64 [Loop If]
    if(I < AchievementInfos.Length)
    {
        AchievementData.AddItem(AchievementInfos[I].Value);        
        I++;
        // [Loop Continue]
        goto J0x0B;
    }
    Record.AchievementValues = AchievementData;
    //return;    
}

function ApplyCheckpointRecord()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL Record[8388609];
    local /*0x97E50000-0x00000000*/ private int I;

    I = 0;
    J0x0B:

    // End:0xA9 [Loop If]
    if(I < AchievementInfos.Length)
    {
        // End:0x9B
        if(I < Record.AchievementValues.Length)
        {
            AchievementInfos[I].Value = Record.AchievementValues[I];
        }
        I++;
        // [Loop Continue]
        goto J0x0B;
    }
    //return;    
}

function GetAchievementValue()
{
    local /*0x97E50000-0x00000000*/ private name AchievementName[8388609];
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689], I;

    I = 0;
    J0x0B:

    // End:0x8C [Loop If]
    if(I < AchievementInfos.Length)
    {
        // End:0x7E
        if(AchievementInfos[I].AchievementName == AchievementName)
        {
            return AchievementInfos[I].Value;
        }
        I++;
        // [Loop Continue]
        goto J0x0B;
    }
    return -1;
    //return ReturnValue;    
}

function SetAchievementValue()
{
    local /*0x97E50000-0x00000000*/ private name AchievementName[8388609];
    local /*0x97E50000-0x00000000*/ private int NewValue[8388609], ReturnValue, I;

    I = 0;
    J0x0B:

    // End:0xDB [Loop If]
    if(I < AchievementInfos.Length)
    {
        // End:0xCD
        if(AchievementInfos[I].AchievementName == AchievementName)
        {
            AchievementInfos[I].Value = NewValue;
            CheckUnlock(I);
            bIsDirty = true;
            return AchievementInfos[I].Value;
        }
        I++;
        // [Loop Continue]
        goto J0x0B;
    }
    return -1;
    //return ReturnValue;    
}

function IncrementAchievementValue()
{
    local /*0x97E50000-0x00000000*/ private name AchievementName[8388609];
    local /*0x97E50000-0x00000000*/ private int Amount[9437185], ReturnValue, I;

    1
    I = 0;
    J0x10:

    // End:0xE1 [Loop If]
    if(I < AchievementInfos.Length)
    {
        // End:0xD3
        if(AchievementInfos[I].AchievementName == AchievementName)
        {
            AchievementInfos[I].Value += Amount;
            CheckUnlock(I);
            bIsDirty = true;
            return AchievementInfos[I].Value;
        }
        I++;
        // [Loop Continue]
        goto J0x10;
    }
    return -1;
    //return ReturnValue;    
}

function OrAchievementValue()
{
    local /*0x97E50000-0x00000000*/ private name AchievementName[8388609];
    local /*0x97E50000-0x00000000*/ private int InOrValue[8388609], ReturnValue, I;

    I = 0;
    J0x0B:

    // End:0x103 [Loop If]
    if(I < AchievementInfos.Length)
    {
        // End:0xF5
        if(AchievementInfos[I].AchievementName == AchievementName)
        {
            AchievementInfos[I].Value = AchievementInfos[I].Value | InOrValue;
            CheckUnlock(I);
            bIsDirty = true;
            return AchievementInfos[I].Value;
        }
        I++;
        // [Loop Continue]
        goto J0x0B;
    }
    return -1;
    //return ReturnValue;    
}

function CheckUnlock()
{
    local /*0x97E50000-0x00000000*/ private int AchievementIndex[8388609], Index;

    // End:0x24
    if(Class'LPGRI_Base_MP'.static.IsPrivateSession())
    {
        return;
    }
    // End:0x1AA
    if((Enabled && (GetMyPlayerController()) != none) && AchievementIndex < AchievementInfos.Length)
    {
        // End:0x1AA
        if(!AchievementInfos[AchievementIndex].Unlocked && AchievementInfos[AchievementIndex].Value >= AchievementInfos[AchievementIndex].UnlockValue)
        {
            Index = ((bIsPS3) ? AchievementInfos[AchievementIndex].TrophyIndex : AchievementInfos[AchievementIndex].AchievementIndex);
            MyPC.ClientUnlockAchievement(Index);
            AchievementInfos[AchievementIndex].Unlocked = true;
            // End:0x1AA
            if(bIsPS3)
            {
                CheckPlatinumTrophy();
            }
        }
    }
    //return;    
}

function UnlockAll()
{
    local /*0x97E50000-0x00000000*/ private int I, AchievementIndex;

    // End:0x16A
    if((GetMyPlayerController()) != none)
    {
        I = 0;
        J0x1B:

        // End:0x13C [Loop If]
        if(I < AchievementInfos.Length)
        {
            // End:0x12E
            if(!AchievementInfos[I].Unlocked)
            {
                AchievementInfos[I].Value = AchievementInfos[I].UnlockValue;
                AchievementIndex = AchievementInfos[I].AchievementIndex;
                MyPC.ClientUnlockAchievement(AchievementIndex);
                AchievementInfos[I].Unlocked = true;
            }
            I++;
            // [Loop Continue]
            goto J0x1B;
        }
        // End:0x16A
        if(Class'Engine.WorldInfo'.static.IsConsoleBuild(2))
        {
            CheckPlatinumTrophy();
        }
    }
    //return;    
}

function CheckPlatinumTrophy()
{
    local /*0x97E50000-0x00000000*/ private int I;

    I = 0;
    J0x0B:

    // End:0x95 [Loop If]
    if(I < AchievementInfos.Length)
    {
        // End:0x87
        if((AchievementInfos[I].AchievementName != 'Platinum') && !AchievementInfos[I].Unlocked)
        {
            return;
        }
        I++;
        // [Loop Continue]
        goto J0x0B;
    }
    SetAchievementValue('Platinum', 1);
    //return;    
}

function AddStatModifiedDelegates()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL AchInfo, Stat;
    local /*0x97E50000-0x00000000*/ private name StatName;

    // End:0xC9
    foreach AchievementInfos(AchInfo)
    {
        StatName = AchInfo.StatName;
        // End:0xC8
        if(StatName != 'None')
        {
            Stat = StatManager.GetStat(StatName);
            // End:0xC8
            if(Stat != none)
            {
                Stat.AddOnStatModifiedDelegate(OnStatModified);                
            }
        }        
    }    
    //return;    
}

function OnStatModified()
{
    local /*0x97E50000-0x00000000*/ private @NULL Stat[8388609];
    local /*0x97E50000-0x00000000*/ private int ChangedVal[8388609];
    local /*0x97E50000-0x00000000*/ private byte ModType[8388609];
    local /*0x97E50000-0x00000000*/ private int Idx;
    local /*0x97E50000-0x00000000*/ private name StatName;

    StatName = Stat.GetStatName();
    Idx = 0;
    J0x34:

    // End:0x194 [Loop If]
    if(Idx < AchievementInfos.Length)
    {
        // End:0x186
        if(StatName == AchievementInfos[Idx].StatName)
        {
            // End:0x186
            if((AchievementInfos[Idx].StatMapName == "") || AchievementInfos[Idx].StatMapName == Class'Engine.WorldInfo'.static.GetWorldInfo().GetMapName())
            {
                SetAchievementValue(AchievementInfos[Idx].AchievementName, Stat.Evaluate(AchievementInfos[Idx].StatPeriod));
            }
        }
        Idx++;
        // [Loop Continue]
        goto J0x34;
    }
    //return;    
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

defaultproperties
{
    AchievementInfos=/* Array type was not detected. */
    Enabled=true
}