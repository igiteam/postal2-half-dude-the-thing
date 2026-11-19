class GameplayEventsWriterBase extends GameplayEvents;

const GAMEEVENT_MATCH_STARTED = 0;
const GAMEEVENT_MATCH_ENDED = 1;
const GAMEEVENT_ROUND_STARTED = 2;
const GAMEEVENT_ROUND_ENDED = 3;
const GAMEEVENT_GAME_CLASS = 6;
const GAMEEVENT_GAME_OPTION_URL = 7;
const GAMEEVENT_GAME_MAPNAME = 8;
const GAMEEVENT_MEMORYUSAGE_POLL = 35;
const GAMEEVENT_FRAMERATE_POLL = 36;
const GAMEEVENT_NETWORKUSAGEIN_POLL = 37;
const GAMEEVENT_NETWORKUSAGEOUT_POLL = 38;
const GAMEEVENT_PING_POLL = 39;
const GAMEEVENT_RENDERTHREAD_POLL = 40;
const GAMEEVENT_GAMETHREAD_POLL = 41;
const GAMEEVENT_GPUFRAMETIME_POLL = 42;
const GAMEEVENT_FRAMETIME_POLL = 43;
const GAMEEVENT_TEAM_CREATED = 50;
const GAMEEVENT_TEAM_GAME_SCORE = 51;
const GAMEEVENT_TEAM_MATCH_WON = 4;
const GAMEEVENT_TEAM_ROUND_WON = 5;
const GAMEEVENT_TEAM_ROUND_STALEMATE = 52;
const GAMEEVENT_PLAYER_LOGIN = 100;
const GAMEEVENT_PLAYER_LOGOUT = 101;
const GAMEEVENT_PLAYER_SPAWN = 102;
const GAMEEVENT_PLAYER_MATCH_WON = 103;
const GAMEEVENT_PLAYER_KILL = 104;
const GAMEEVENT_PLAYER_LOCATION_POLL = 105;
const GAMEEVENT_PLAYER_TEAMCHANGE = 106;
const GAMEEVENT_PLAYER_KILL_STREAK = 107;
const GAMEEVENT_PLAYER_DEATH = 108;
const GAMEEVENT_PLAYER_ROUND_WON = 109;
const GAMEEVENT_PLAYER_ROUND_STALEMATE = 110;
const GAMEEVENT_WEAPON_DAMAGE = 150;
const GAMEEVENT_WEAPON_DAMAGE_MELEE = 151;
const GAMEEVENT_WEAPON_FIRED = 152;
const GAMEEVENT_PLAYER_KILL_NORMAL = 200;
const GAMEEVENT_GENERIC_PARAM_LIST_START = 300;
const GAMEEVENT_GENERIC_PARAM_LIST_END = 400;
const GAMEEVENT_GAME_SPECIFIC = 1000;
const GAMEEVENT_MAX_EVENTID = 0x0000FFFF;

var(*) /*0x35EA0000-0x00000000*/ private @NULL Game[131073];

function IsSessionInProgress()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    return CurrentSessionInfo.bGameplaySessionInProgress;
    //return ReturnValue;    
}

event StartPolling()
{
    local /*0x35EA0000-0x00000000*/ private float HearbeatDelta[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL WI;

    WI = Class'WorldInfo'.static.GetWorldInfo();
    // End:0xA0
    if((WI != none) && WI.Game != none)
    {
        WI.Game.SetTimer(HearbeatDelta, true, 'Poll', self);
    }
    //return;    
}

event StopPolling()
{
    local /*0x35EA0000-0x00000000*/ private @NULL WI;

    WI = Class'WorldInfo'.static.GetWorldInfo();
    // End:0x9D
    if((WI != none) && WI.Game != none)
    {
        WI.Game.ClearTimer('Poll', self);
    }
    //return;    
}

function Poll()
{
    local /*0x35EA0000-0x00000000*/ private @NULL WI;

    WI = Class'WorldInfo'.static.GetWorldInfo();
    // End:0xF7
    if(WI.Pauser == none)
    {
        // End:0xED
        if((WI.Game != none) && !WI.Game.bWaitingToStartMatch)
        {
            LogAllPlayerPositionsEvent(105);
            WI.Game.GameEventsPoll();
        }
        LogSystemPollEvents();
    }
    //return;    
}

event GetGameTypeId()
{
    local /*0x35EA0000-0x00000000*/ private int ReturnValue[92274689];

    return 0;
    //return ReturnValue;    
}

event GetPlaylistId()
{
    local /*0x35EA0000-0x00000000*/ private int ReturnValue[92274689];

    return -1;
    //return ReturnValue;    
}

function StartLogging()
{
    local /*0x35EA0000-0x00000000*/ private float HeartbeatDelta[9437185];

    //return;    
}

function ResetLogging()
{
    local /*0x35EA0000-0x00000000*/ private float HeartbeatDelta[9437185];

    //return;    
}

function EndLogging()
{
    //return;    
}

function LogGameIntEvent()
{
    local /*0x35EA0000-0x00000000*/ private int EventID[8388609], Value;

    //return;    
}

function LogGameStringEvent()
{
    local /*0x35EA0000-0x00000000*/ private int EventID[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize string Value[8388609];

    //return;    
}

function LogGameFloatEvent()
{
    local /*0x35EA0000-0x00000000*/ private int EventID[8388609];
    local /*0x35EA0000-0x00000000*/ private float Value[8388609];

    //return;    
}

function LogGamePositionEvent()
{
    local /*0x35EA0000-0x00000000*/ private int EventID[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL Position[25296897];
    local /*0x35EA0000-0x00000000*/ private float Value[8388609];

    //return;    
}

function LogTeamIntEvent()
{
    local /*0x35EA0000-0x00000000*/ private int EventID[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL Team[8388609];
    local /*0x35EA0000-0x00000000*/ private int Value[8388609];

    //return;    
}

function LogTeamFloatEvent()
{
    local /*0x35EA0000-0x00000000*/ private int EventID[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL Team[8388609];
    local /*0x35EA0000-0x00000000*/ private float Value[8388609];

    //return;    
}

function LogTeamStringEvent()
{
    local /*0x35EA0000-0x00000000*/ private int EventID[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL Team[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize string Value[8388609];

    //return;    
}

function LogPlayerIntEvent()
{
    local /*0x35EA0000-0x00000000*/ private int EventID[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL Player[8388609];
    local /*0x35EA0000-0x00000000*/ private int Value[8388609];

    //return;    
}

function LogPlayerFloatEvent()
{
    local /*0x35EA0000-0x00000000*/ private int EventID[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL Player[8388609];
    local /*0x35EA0000-0x00000000*/ private float Value[8388609];

    //return;    
}

function LogPlayerStringEvent()
{
    local /*0x35EA0000-0x00000000*/ private int EventID[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL Player[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize string EventString[8388609];

    //return;    
}

function LogPlayerSpawnEvent()
{
    local /*0x35EA0000-0x00000000*/ private int EventID[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL Player[8388609];
    local /*0x35EA0000-0x00000000*/ private class PawnClass[8388609];
    local /*0x35EA0000-0x00000000*/ private int TeamID[8388609];

    //return;    
}

function LogPlayerLoginChange()
{
    local /*0x35EA0000-0x00000000*/ private int EventID[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL Player[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize string PlayerName[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL PlayerID[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bSplitScreen[8388609];

    //return;    
}

function LogAllPlayerPositionsEvent()
{
    local /*0x35EA0000-0x00000000*/ private int EventID[8388609];

    //return;    
}

function LogPlayerKillDeath()
{
    local /*0x35EA0000-0x00000000*/ private int EventID[8388609], KillType;
    local /*0x35EA0000-0x00000000*/ private @NULL Killer[8388609];
    local /*0x35EA0000-0x00000000*/ private class dmgType[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL Dead[8388609];

    //return;    
}

function LogPlayerPlayerEvent()
{
    local /*0x35EA0000-0x00000000*/ private int EventID[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL Player[8388609], Target;

    //return;    
}

function LogWeaponIntEvent()
{
    local /*0x35EA0000-0x00000000*/ private int EventID[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL Player[8388609];
    local /*0x35EA0000-0x00000000*/ private class WeaponClass[8388609];
    local /*0x35EA0000-0x00000000*/ private int Value[8388609];

    //return;    
}

function LogDamageEvent()
{
    local /*0x35EA0000-0x00000000*/ private int EventID[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL Player[8388609];
    local /*0x35EA0000-0x00000000*/ private class dmgType[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL Target[8388609];
    local /*0x35EA0000-0x00000000*/ private int Amount[8388609];

    //return;    
}

function LogProjectileIntEvent()
{
    local /*0x35EA0000-0x00000000*/ private int EventID[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL Player[8388609];
    local /*0x35EA0000-0x00000000*/ private class Proj[8388609];
    local /*0x35EA0000-0x00000000*/ private int Value[8388609];

    //return;    
}

function LogSystemPollEvents()
{
    //return;    
}

function RecordAIPathFail()
{
    local /*0x35EA0000-0x00000000*/ private @NULL AI[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize string Reason[142606337];
    local /*0x35EA0000-0x00000000*/ private @NULL Dest[8388609];

    //return;    
}

function RecordCoverLinkFireLinks()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Link[8388609], Player;
    local /*0x35EA0000-0x00000000*/ private int ReturnValue[92274689];

    //return ReturnValue;    
}
