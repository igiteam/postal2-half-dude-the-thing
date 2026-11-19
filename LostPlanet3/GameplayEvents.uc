class GameplayEvents extends Object
    abstract;

const HeaderFlags_NoEventStrings = 1;

enum EGameStatGroups
{
    GSG_EngineStats,                // 0
    GSG_Game,                       // 1
    GSG_Team,                       // 2
    GSG_Player,                     // 3
    GSG_Weapon,                     // 4
    GSG_Damage,                     // 5
    GSG_Projectile,                 // 6
    GSG_Pawn,                       // 7
    GSG_GameSpecific,               // 8
    GSG_Aggregate,                  // 9
    GSG_MAX                         // 10
};

struct native GameStatGroup
{
    var(*) /*0x35EA0000-0x00000000*/ private byte Group;
    var(*) /*0x35EA0000-0x00000000*/ private int Level;

    structdefaultproperties
    {
        Group=EGameStatGroups.GSG_EngineStats
        Level=0
    }
};

struct native GameplayEventsHeader
{
    var(*) /*0x35EA0000-0x00000000*/ private int EngineVersion[131073];
    var(*) /*0x35EA0000-0x00000000*/ private int StatsWriterVersion[131073];
    var(*) /*0x35EA0000-0x00000000*/ private int StreamOffset[131073];
    var(*) /*0x35EA0000-0x00000000*/ private int AggregateOffset[131073];
    var(*) /*0x35EA0000-0x00000000*/ private int FooterOffset[131073];
    var(*) /*0x35EA0000-0x00000000*/ private int TotalStreamSize[131073];
    var(*) /*0x35EA0000-0x00000000*/ private int FileSize[131073];
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string FilterClass;
    var(*) /*0x35EA0000-0x00000000*/ private int Flags;

    structdefaultproperties
    {
        EngineVersion=0
        StatsWriterVersion=0
        StreamOffset=0
        AggregateOffset=0
        FooterOffset=0
        TotalStreamSize=0
        FileSize=0
        FilterClass=""
        Flags=0
    }
};

struct native GameSessionInformation
{
    var(*) /*0x35EA0000-0x00000000*/ private int AppTitleID;
    var(*) /*0x35EA0000-0x00000000*/ private int PlatformType;
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string Language;
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string GameplaySessionTimestamp[131073];
    var(*) /*0x35EA0000-0x00000000*/ private float GameplaySessionStartTime[131073];
    var(*) /*0x35EA0000-0x00000000*/ private float GameplaySessionEndTime[131073];
    var(*) /*0x35EA0000-0x00000000*/ private bool bGameplaySessionInProgress[131073];
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string GameplaySessionID[131073];
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string GameClassName[131073];
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string MapName[131073];
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string MapURL[131073];
    var(*) /*0x35EA0000-0x00000000*/ private int SessionInstance[131073];
    var(*) /*0x35EA0000-0x00000000*/ private int GameTypeId[131073];
    var(*) /*0x35EA0000-0x00000000*/ private @NULL OwningNetId[131073];
    var(*) /*0x35EA0000-0x00000000*/ private int PlaylistId;

    structdefaultproperties
    {
        AppTitleID=0
        PlatformType=0
        Language=""
        GameplaySessionTimestamp=""
        GameplaySessionStartTime=0.0000000
        GameplaySessionEndTime=0.0000000
        bGameplaySessionInProgress=false
        GameplaySessionID=""
        GameClassName=""
        MapName=""
        MapURL=""
        SessionInstance=0
        GameTypeId=0
        OwningNetId=(Uid=(Data=none,Data[1]=none,Data[2]=none,Data[3]=none,Data[4]=none,Data[5]=none,Data[6]=none,Data[7]=none))
        PlaylistId=0
    }
};

struct native TeamInformation
{
    var(*) /*0x35EA0000-0x00000000*/ private int TeamIndex;
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string TeamName;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL TeamColor;
    var(*) /*0x35EA0000-0x00000000*/ private int MaxSize;

    structdefaultproperties
    {
        TeamIndex=0
        TeamName=""
        TeamColor=(R=0,G=0,B=0,A=0)
        MaxSize=0
    }
};

struct native PlayerInformation
{
    var(*) /*0x35EA0000-0x00000000*/ private name ControllerName;
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string PlayerName;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL UniqueId;
    var(*) /*0x35EA0000-0x00000000*/ private bool bIsBot;

    structdefaultproperties
    {
        ControllerName="None"
        PlayerName=""
        UniqueId=(Uid=(Data=none,Data[1]=none,Data[2]=none,Data[3]=none,Data[4]=none,Data[5]=none,Data[6]=none,Data[7]=none))
        bIsBot=false
    }
};

struct native GameplayEventMetaData
{
    var(*) /*0x35EA0000-0x00000000*/ private int EventID[131073];
    var(*) /*0x35EA0000-0x00000000*/ private name EventName[131073];
    var(*) /*0x35EA0000-0x00000000*/ private @NULL StatGroup[131073];
    var(*) /*0x35EA0000-0x00000000*/ private int EventDataType[131073];

    structdefaultproperties
    {
        EventID=0
        EventName="None"
        StatGroup=(Group=EGameStatGroups.GSG_EngineStats,Level=0)
        EventDataType=0
    }
};

struct native WeaponClassEventData
{
    var(*) /*0x35EA0000-0x00000000*/ private name WeaponClassName;

    structdefaultproperties
    {
        WeaponClassName="None"
    }
};

struct native DamageClassEventData
{
    var(*) /*0x35EA0000-0x00000000*/ private name DamageClassName;

    structdefaultproperties
    {
        DamageClassName="None"
    }
};

struct native ProjectileClassEventData
{
    var(*) /*0x35EA0000-0x00000000*/ private name ProjectileClassName;

    structdefaultproperties
    {
        ProjectileClassName="None"
    }
};

struct native PawnClassEventData
{
    var(*) /*0x35EA0000-0x00000000*/ private name PawnClassName;

    structdefaultproperties
    {
        PawnClassName="None"
    }
};

var(*) /*0x35EA0000-0x00000000*/ private @NULL Archive[268566529];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string StatsFileName[131073];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize @NULL Header;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize @NULL CurrentSessionInfo;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array PlayerList[131073];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array TeamList[131073];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array SupportedEvents;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array WeaponClassArray;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array DamageClassArray;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array ProjectileClassArray;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array PawnClassArray;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array ActorArray;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array SoundCueArray;

function OpenStatsFile()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string Filename[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

function CloseStatsFile()
{
    //return;    
}

event GetFilename()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string ReturnValue[92274689];

    return StatsFileName;
    //return ReturnValue;    
}

defaultproperties
{
    SupportedEvents=/* Array type was not detected. */
}