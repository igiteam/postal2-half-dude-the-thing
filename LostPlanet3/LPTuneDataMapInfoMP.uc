class LPTuneDataMapInfoMP extends SPEngineTuneDataBase
    hidecategories(Object,Object,Object);

enum eAnnouncementEventName
{
    AEN_None,                       // 0
    AEN_RoundStarted,               // 1
    AEN_TimeRemainingHalf,          // 2
    AEN_TimeRemainingQuarter,       // 3
    AEN_TimeRemainingOneMinute,     // 4
    AEN_TeamWinning,                // 5
    AEN_TeamWinsRound,              // 6
    AEN_TeamWinsMatch,              // 7
    AEN_LowRespawns,                // 8
    AEN_TENGPocketStarted,          // 9
    AEN_TENGPocketCompletelyControlled,// 10
    AEN_TENGPocketMostlyDrained,    // 11
    AEN_TENGPocketFullyDrained,     // 12
    AEN_DynamicEnvironmentStorm,    // 13
    AEN_DynamicEnvironmentMeteorShower,// 14
    AEN_DynamicEnvironmentLunarApex,// 15
    AEN_DynamicEnvironmentBreedingSeason,// 16
    AEN_ObjectiveBegin,             // 17
    AEN_ObjectiveArmed,             // 18
    AEN_ObjectiveBeingRepaired,     // 19
    AEN_ObjectiveControlled,        // 20
    AEN_ObjectiveDestroyed,         // 21
    AEN_ObjectiveDisarmed,          // 22
    AEN_ObjectiveDropped,           // 23
    AEN_ObjectiveNeutralized,       // 24
    AEN_ObjectiveOccupied,          // 25
    AEN_ObjectivePickedUp,          // 26
    AEN_ObjectivePickedUpAkrid,     // 27
    AEN_ObjectiveReachedDest,       // 28
    AEN_ObjectiveReachedSource,     // 29
    AEN_ObjectiveRepaired,          // 30
    AEN_ObjectiveTakingDamage,      // 31
    AEN_ObjectiveTouched,           // 32
    AEN_ObjectiveUnoccupied,        // 33
    AEN_ObjectiveUntouched,         // 34
    AEN_MAX                         // 35
};

struct native AnnouncementInfoStruct
{
    var(0.25_Pct) /*0x06B70000-0x00000000*/ private byte AnnouncementEventName[65537];
    var(0.25_Pct) /*0x06B70000-0x00000000*/ private editfixedsize array NevecAkEvents[65537];
    var(0.25_Pct) /*0x06B70000-0x00000000*/ private editfixedsize array NevecAkEventsAlternate[65537];
    var(0.25_Pct) /*0x06B70000-0x00000000*/ private editfixedsize array PiratesAkEvents[65537];
    var(0.25_Pct) /*0x06B70000-0x00000000*/ private editfixedsize array PiratesAkEventsAlternate[65537];
    var(0.25_Pct) /*0x06B70000-0x00000000*/ private float MinTimeBeforeRepeat[65537];
    var(0.25_Pct) /*0x06B70000-0x00000000*/ private bool bShouldOverride[65537];
    var(0.25_Pct) /*0x06B70000-0x00000000*/ private bool bShouldQueue[65537];

    structdefaultproperties
    {
        AnnouncementEventName=eAnnouncementEventName.AEN_None
        NevecAkEvents=none
        NevecAkEventsAlternate=none
        PiratesAkEvents=none
        PiratesAkEventsAlternate=none
        MinTimeBeforeRepeat=0.0000000
        bShouldOverride=false
        bShouldQueue=false
    }
};

struct native PlayedAnnouncementInfo
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private int LastNevecIndex;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private int LastNevecAlternateIndex;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private int LastPirateIndex;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private int LastPirateAlternateIndex;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float LastPlayedTime;

    structdefaultproperties
    {
        LastNevecIndex=-1
        LastNevecAlternateIndex=-1
        LastPirateIndex=-1
        LastPirateAlternateIndex=-1
        LastPlayedTime=0.0000000
    }
};

var(0.25_Pct) /*0x06BA0000-0x00000400*/ private editfixedsize array AnnouncementDialogs[589825];
var(0.25_Pct) /*0x06BA0000-0x00000000*/ private @NULL SoundMode[65537];
var(0.25_Pct) /*0x06BA0000-0x00000000*/ private int SoundModePriority[65537];
var(0.25_Pct) /*0x06BA0000-0x00000000*/ private float MinScorePercentToPlayWinLoseEvents[65537];
var(0.25_Pct) /*0x06BA0000-0x00000000*/ private int ScoreDiffPercentToPlayWinLoseEvents[65537];
var(0.25_Pct) /*0x06BA0000-0x00000000*/ private int NumLivesToPlayLowRespawnEvents[65537];
var(0.25_Pct) /*0x06BA0000-0x00000000*/ private int TEnergyPercentToPlayMostlyDrainedEvents[65537];
var(0.25_Pct) /*0x01690000-0x00000400*/ private editfixedsize array MapAchievementInfos[589825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL LastPlayedAnnouncementInfo[536870947];

static function @NULL BroadcastAnnouncement()
{
    local /*0x97E50000-0x00000000*/ private byte AnnouncementName[8388609];
    local /*0x97E50000-0x00000000*/ private int BroadcastToTeamNum[9437185], InstigatorTeamNum;
    local /*0x97E50000-0x00000400*/ private @NULL ObjectiveComp[9437185], WI, LPPC, TDMI;
    local /*0x97E50000-0x00000000*/ private byte bOverride, bQueue;
    local /*0x97E50000-0x00000000*/ private float LastPlayedTime, MinTimeBeforeRepeat;

    -1
    -1    
    WI = Class'Engine.WorldInfo'.static.GetWorldInfo();
    TDMI = LPMapInfo_MP(WI.GetMapInfo()).TuneDataMapInfo;
    // End:0xFF
    if((TDMI == none) || TDMI.GetAkEvent(AnnouncementName, Max(BroadcastToTeamNum, 0), bOverride, bQueue, MinTimeBeforeRepeat, InstigatorTeamNum, ObjectiveComp) == none)
    {
        return;
    }
    LastPlayedTime = TDMI.LastPlayedAnnouncementInfo[int(AnnouncementName)].LastPlayedTime;
    // End:0x192
    if((LastPlayedTime > float(0)) && (LastPlayedTime + MinTimeBeforeRepeat) > WI.TimeSeconds)
    {
        return;
    }
    TDMI.LastPlayedAnnouncementInfo[int(AnnouncementName)].LastPlayedTime = WI.TimeSeconds;
    // End:0x2A1
    foreach WI.AllControllers(Class'LPPlayerController', LPPC)
    {
        // End:0x2A0
        if((BroadcastToTeamNum == -1) || int(LPPC.GetTeamNum()) == BroadcastToTeamNum)
        {
            LPPC.ClientReceiveAnnouncement(AnnouncementName, InstigatorTeamNum, ObjectiveComp);
        }        
    }    
    //return;    
}

function @NULL GetAkEvent()
{
    local /*0x97E50000-0x00000000*/ private byte AnnouncementName[8388609];
    local /*0x97E50000-0x00000000*/ private int MyTeamNum[8388609];
    local /*0x97E50000-0x00000000*/ private byte bShouldOverride[25165825], bShouldQueue;
    local /*0x97E50000-0x00000000*/ private float MinTimeBeforeRepeat[25165825];
    local /*0x97E50000-0x00000000*/ private int InstigatorTeamNum[9437185];
    local /*0x97E50000-0x00000400*/ private @NULL ObjectiveComp[9437185], ReturnValue;
    local /*0x97E50000-0x00000000*/ private int Idx, RandomIdx;
    local /*0x97E50000-0x00000000*/ private editfixedsize array Announcements;

    -1    
    // End:0x44
    if(ObjectiveComp != none)
    {
        Announcements = ObjectiveComp.AnnouncementDialogs;        
    }
    else
    {
        Announcements = AnnouncementDialogs;
    }
    Idx = 0;
    J0x62:

    // End:0x558 [Loop If]
    if(Idx < Announcements.Length)
    {
        // End:0x54A
        if(int(Announcements[Idx].AnnouncementEventName) == int(AnnouncementName))
        {
            bShouldOverride = byte(Announcements[Idx].bShouldOverride);
            bShouldQueue = byte(Announcements[Idx].bShouldQueue);
            MinTimeBeforeRepeat = Announcements[Idx].MinTimeBeforeRepeat;
            // End:0x352
            if(MyTeamNum == 0)
            {
                // End:0x25D
                if((InstigatorTeamNum == 1) && Announcements[Idx].NevecAkEventsAlternate.Length > 0)
                {
                    RandomIdx = RandomAnnouncementIndex(Announcements[Idx].NevecAkEventsAlternate.Length - 1, LastPlayedAnnouncementInfo[Idx].LastNevecAlternateIndex);
                    LastPlayedAnnouncementInfo[Idx].LastNevecAlternateIndex = RandomIdx;
                    return Announcements[Idx].NevecAkEventsAlternate[RandomIdx];                    
                }
                else
                {
                    // End:0x34F
                    if(Announcements[Idx].NevecAkEvents.Length > 0)
                    {
                        RandomIdx = RandomAnnouncementIndex(Announcements[Idx].NevecAkEvents.Length - 1, LastPlayedAnnouncementInfo[Idx].LastNevecIndex);
                        LastPlayedAnnouncementInfo[Idx].LastNevecIndex = RandomIdx;
                        return Announcements[Idx].NevecAkEvents[RandomIdx];
                    }
                }                
            }
            else
            {
                // End:0x458
                if((InstigatorTeamNum == 1) && Announcements[Idx].PiratesAkEventsAlternate.Length > 0)
                {
                    RandomIdx = RandomAnnouncementIndex(Announcements[Idx].PiratesAkEventsAlternate.Length - 1, LastPlayedAnnouncementInfo[Idx].LastPirateAlternateIndex);
                    LastPlayedAnnouncementInfo[Idx].LastPirateAlternateIndex = RandomIdx;
                    return Announcements[Idx].PiratesAkEventsAlternate[RandomIdx];                    
                }
                else
                {
                    // End:0x54A
                    if(Announcements[Idx].PiratesAkEvents.Length > 0)
                    {
                        RandomIdx = RandomAnnouncementIndex(Announcements[Idx].PiratesAkEvents.Length - 1, LastPlayedAnnouncementInfo[Idx].LastPirateIndex);
                        LastPlayedAnnouncementInfo[Idx].LastPirateIndex = RandomIdx;
                        return Announcements[Idx].PiratesAkEvents[RandomIdx];
                    }
                }
            }
        }
        Idx++;
        // [Loop Continue]
        goto J0x62;
    }
    // End:0x5AC
    if(ObjectiveComp != none)
    {
        return GetAkEvent(AnnouncementName, MyTeamNum, bShouldOverride, bShouldQueue, MinTimeBeforeRepeat, InstigatorTeamNum);        
    }
    else
    {
        return none;
    }
    //return ReturnValue;    
}

function RandomAnnouncementIndex()
{
    local /*0x97E50000-0x00000000*/ private int RandMax[8388609], ExcludeIndex, ReturnValue, Result, LoopCount;

    -1
    // End:0x1A
    if(RandMax <= 0)
    {
        return 0;
    }
    LoopCount = 0;
    Result = ExcludeIndex;
    J0x38:

    // End:0xA2 [Loop If]
    if((Result == ExcludeIndex) && LoopCount < 10)
    {
        Result = Class'SPEngine.SPUtil'.static.RandRangeInt(0, RandMax);
        LoopCount++;
        // [Loop Continue]
        goto J0x38;
    }
    return Result;
    //return ReturnValue;    
}

static function GetTEngMostlyDrainedThreshold()
{
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL TDMI;

    TDMI = LPMapInfo_MP(Class'Engine.WorldInfo'.static.GetWorldInfo().GetMapInfo()).TuneDataMapInfo;
    // End:0x8D
    if(TDMI != none)
    {
        return TDMI.TEnergyPercentToPlayMostlyDrainedEvents;
    }
    return default.TEnergyPercentToPlayMostlyDrainedEvents;
    //return ReturnValue;    
}

static function GetLowRespawnThreshold()
{
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL TDMI;

    TDMI = LPMapInfo_MP(Class'Engine.WorldInfo'.static.GetWorldInfo().GetMapInfo()).TuneDataMapInfo;
    // End:0x8D
    if(TDMI != none)
    {
        return TDMI.NumLivesToPlayLowRespawnEvents;
    }
    return default.NumLivesToPlayLowRespawnEvents;
    //return ReturnValue;    
}

static function GetMapAchievementInfo()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL ReturnValue[92274689], WI, TDMI;
    local /*0x97E50000-0x00000000*/ private editfixedsize string CurrentMapName;
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL DefaultInfo;
    local /*0x97E50000-0x00000000*/ private int InfoIndex;

    WI = Class'Engine.WorldInfo'.static.GetWorldInfo();
    // End:0x130
    if(WI != none)
    {
        CurrentMapName = WI.GetMapName();
        TDMI = LPMapInfo_MP(WI.GetMapInfo()).TuneDataMapInfo;
        // End:0x130
        if(TDMI != none)
        {
            InfoIndex = TDMI.MapAchievementInfos.Find('MapName', CurrentMapName);            
            // End:0x130
            if(InfoIndex >= 0)
            {
                return TDMI.MapAchievementInfos[InfoIndex];
            }
        }
    }
    return DefaultInfo;
    //return ReturnValue;    
}

defaultproperties
{
    MinScorePercentToPlayWinLoseEvents=25.0000000
    ScoreDiffPercentToPlayWinLoseEvents=50
    NumLivesToPlayLowRespawnEvents=10
    TEnergyPercentToPlayMostlyDrainedEvents=20
    LastPlayedAnnouncementInfo[0]=(LastNevecIndex=-1,LastNevecAlternateIndex=-1,LastPirateIndex=-1,LastPirateAlternateIndex=-1,LastPlayedTime=0.0000000)
    LastPlayedAnnouncementInfo[1]=(LastNevecIndex=-1,LastNevecAlternateIndex=-1,LastPirateIndex=-1,LastPirateAlternateIndex=-1,LastPlayedTime=0.0000000)
    LastPlayedAnnouncementInfo[2]=(LastNevecIndex=-1,LastNevecAlternateIndex=-1,LastPirateIndex=-1,LastPirateAlternateIndex=-1,LastPlayedTime=0.0000000)
    LastPlayedAnnouncementInfo[3]=(LastNevecIndex=-1,LastNevecAlternateIndex=-1,LastPirateIndex=-1,LastPirateAlternateIndex=-1,LastPlayedTime=0.0000000)
    LastPlayedAnnouncementInfo[4]=(LastNevecIndex=-1,LastNevecAlternateIndex=-1,LastPirateIndex=-1,LastPirateAlternateIndex=-1,LastPlayedTime=0.0000000)
    LastPlayedAnnouncementInfo[5]=(LastNevecIndex=-1,LastNevecAlternateIndex=-1,LastPirateIndex=-1,LastPirateAlternateIndex=-1,LastPlayedTime=0.0000000)
    LastPlayedAnnouncementInfo[6]=(LastNevecIndex=-1,LastNevecAlternateIndex=-1,LastPirateIndex=-1,LastPirateAlternateIndex=-1,LastPlayedTime=0.0000000)
    LastPlayedAnnouncementInfo[7]=(LastNevecIndex=-1,LastNevecAlternateIndex=-1,LastPirateIndex=-1,LastPirateAlternateIndex=-1,LastPlayedTime=0.0000000)
    LastPlayedAnnouncementInfo[8]=(LastNevecIndex=-1,LastNevecAlternateIndex=-1,LastPirateIndex=-1,LastPirateAlternateIndex=-1,LastPlayedTime=0.0000000)
    LastPlayedAnnouncementInfo[9]=(LastNevecIndex=-1,LastNevecAlternateIndex=-1,LastPirateIndex=-1,LastPirateAlternateIndex=-1,LastPlayedTime=0.0000000)
    LastPlayedAnnouncementInfo[10]=(LastNevecIndex=-1,LastNevecAlternateIndex=-1,LastPirateIndex=-1,LastPirateAlternateIndex=-1,LastPlayedTime=0.0000000)
    LastPlayedAnnouncementInfo[11]=(LastNevecIndex=-1,LastNevecAlternateIndex=-1,LastPirateIndex=-1,LastPirateAlternateIndex=-1,LastPlayedTime=0.0000000)
    LastPlayedAnnouncementInfo[12]=(LastNevecIndex=-1,LastNevecAlternateIndex=-1,LastPirateIndex=-1,LastPirateAlternateIndex=-1,LastPlayedTime=0.0000000)
    LastPlayedAnnouncementInfo[13]=(LastNevecIndex=-1,LastNevecAlternateIndex=-1,LastPirateIndex=-1,LastPirateAlternateIndex=-1,LastPlayedTime=0.0000000)
    LastPlayedAnnouncementInfo[14]=(LastNevecIndex=-1,LastNevecAlternateIndex=-1,LastPirateIndex=-1,LastPirateAlternateIndex=-1,LastPlayedTime=0.0000000)
    LastPlayedAnnouncementInfo[15]=(LastNevecIndex=-1,LastNevecAlternateIndex=-1,LastPirateIndex=-1,LastPirateAlternateIndex=-1,LastPlayedTime=0.0000000)
    LastPlayedAnnouncementInfo[16]=(LastNevecIndex=-1,LastNevecAlternateIndex=-1,LastPirateIndex=-1,LastPirateAlternateIndex=-1,LastPlayedTime=0.0000000)
    LastPlayedAnnouncementInfo[17]=(LastNevecIndex=-1,LastNevecAlternateIndex=-1,LastPirateIndex=-1,LastPirateAlternateIndex=-1,LastPlayedTime=0.0000000)
    LastPlayedAnnouncementInfo[18]=(LastNevecIndex=-1,LastNevecAlternateIndex=-1,LastPirateIndex=-1,LastPirateAlternateIndex=-1,LastPlayedTime=0.0000000)
    LastPlayedAnnouncementInfo[19]=(LastNevecIndex=-1,LastNevecAlternateIndex=-1,LastPirateIndex=-1,LastPirateAlternateIndex=-1,LastPlayedTime=0.0000000)
    LastPlayedAnnouncementInfo[20]=(LastNevecIndex=-1,LastNevecAlternateIndex=-1,LastPirateIndex=-1,LastPirateAlternateIndex=-1,LastPlayedTime=0.0000000)
    LastPlayedAnnouncementInfo[21]=(LastNevecIndex=-1,LastNevecAlternateIndex=-1,LastPirateIndex=-1,LastPirateAlternateIndex=-1,LastPlayedTime=0.0000000)
    LastPlayedAnnouncementInfo[22]=(LastNevecIndex=-1,LastNevecAlternateIndex=-1,LastPirateIndex=-1,LastPirateAlternateIndex=-1,LastPlayedTime=0.0000000)
    LastPlayedAnnouncementInfo[23]=(LastNevecIndex=-1,LastNevecAlternateIndex=-1,LastPirateIndex=-1,LastPirateAlternateIndex=-1,LastPlayedTime=0.0000000)
    LastPlayedAnnouncementInfo[24]=(LastNevecIndex=-1,LastNevecAlternateIndex=-1,LastPirateIndex=-1,LastPirateAlternateIndex=-1,LastPlayedTime=0.0000000)
    LastPlayedAnnouncementInfo[25]=(LastNevecIndex=-1,LastNevecAlternateIndex=-1,LastPirateIndex=-1,LastPirateAlternateIndex=-1,LastPlayedTime=0.0000000)
    LastPlayedAnnouncementInfo[26]=(LastNevecIndex=-1,LastNevecAlternateIndex=-1,LastPirateIndex=-1,LastPirateAlternateIndex=-1,LastPlayedTime=0.0000000)
    LastPlayedAnnouncementInfo[27]=(LastNevecIndex=-1,LastNevecAlternateIndex=-1,LastPirateIndex=-1,LastPirateAlternateIndex=-1,LastPlayedTime=0.0000000)
    LastPlayedAnnouncementInfo[28]=(LastNevecIndex=-1,LastNevecAlternateIndex=-1,LastPirateIndex=-1,LastPirateAlternateIndex=-1,LastPlayedTime=0.0000000)
    LastPlayedAnnouncementInfo[29]=(LastNevecIndex=-1,LastNevecAlternateIndex=-1,LastPirateIndex=-1,LastPirateAlternateIndex=-1,LastPlayedTime=0.0000000)
    LastPlayedAnnouncementInfo[30]=(LastNevecIndex=-1,LastNevecAlternateIndex=-1,LastPirateIndex=-1,LastPirateAlternateIndex=-1,LastPlayedTime=0.0000000)
    LastPlayedAnnouncementInfo[31]=(LastNevecIndex=-1,LastNevecAlternateIndex=-1,LastPirateIndex=-1,LastPirateAlternateIndex=-1,LastPlayedTime=0.0000000)
    LastPlayedAnnouncementInfo[32]=(LastNevecIndex=-1,LastNevecAlternateIndex=-1,LastPirateIndex=-1,LastPirateAlternateIndex=-1,LastPlayedTime=0.0000000)
    LastPlayedAnnouncementInfo[33]=(LastNevecIndex=-1,LastNevecAlternateIndex=-1,LastPirateIndex=-1,LastPirateAlternateIndex=-1,LastPlayedTime=0.0000000)
    LastPlayedAnnouncementInfo[34]=(LastNevecIndex=-1,LastNevecAlternateIndex=-1,LastPirateIndex=-1,LastPirateAlternateIndex=-1,LastPlayedTime=0.0000000)
}