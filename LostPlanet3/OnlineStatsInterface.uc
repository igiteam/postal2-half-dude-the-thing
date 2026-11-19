interface OnlineStatsInterface extends Interface
    abstract;

function ReadOnlineStats()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize array Players[25296897];
    local /*0x35EA0000-0x00000000*/ private @NULL StatsRead[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

function ReadOnlineStatsForFriends()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL StatsRead[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

function ReadOnlineStatsByRank()
{
    local /*0x35EA0000-0x00000000*/ private @NULL StatsRead[8388609];
    local /*0x35EA0000-0x00000000*/ private int StartIndex[9437185], NumToRead;
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    1
    100
    //return ReturnValue;    
}

function ReadOnlineStatsByRankAroundPlayer()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL StatsRead[8388609];
    local /*0x35EA0000-0x00000000*/ private int NumRows[9437185];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    10
    //return ReturnValue;    
}

delegate OnReadOnlineStatsComplete()
{
    local /*0x35EA0000-0x00000000*/ private bool bWasSuccessful[8388609];

    //return;    
}

function AddReadOnlineStatsCompleteDelegate()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> ReadOnlineStatsCompleteDelegate[8388609];

    //return;    
}

function ClearReadOnlineStatsCompleteDelegate()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> ReadOnlineStatsCompleteDelegate[8388609];

    //return;    
}

function FreeStats()
{
    local /*0x35EA0000-0x00000000*/ private @NULL StatsRead[8388609];

    //return;    
}

function WriteOnlineStats()
{
    local /*0x35EA0000-0x00000000*/ private name SessionName[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL Player[8388609], StatsWrite;
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

function FlushOnlineStats()
{
    local /*0x35EA0000-0x00000000*/ private name SessionName[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

delegate OnFlushOnlineStatsComplete()
{
    local /*0x35EA0000-0x00000000*/ private name SessionName[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bWasSuccessful[8388609];

    //return;    
}

function AddFlushOnlineStatsCompleteDelegate()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> FlushOnlineStatsCompleteDelegate[8388609];

    //return;    
}

function ClearFlushOnlineStatsCompleteDelegate()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> FlushOnlineStatsCompleteDelegate[8388609];

    //return;    
}

function WriteOnlinePlayerScores()
{
    local /*0x35EA0000-0x00000000*/ private name SessionName[8388609];
    local /*0x35EA0000-0x00000000*/ private int LeaderboardId[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize array PlayerScores[25296897];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

function GetHostStatGuid()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string ReturnValue[92274689];

    //return ReturnValue;    
}

function RegisterHostStatGuid()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string HostStatGuid[25296897];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

delegate OnRegisterHostStatGuidComplete()
{
    local /*0x35EA0000-0x00000000*/ private bool bWasSuccessful[8388609];

    //return;    
}

function AddRegisterHostStatGuidCompleteDelegate()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> RegisterHostStatGuidCompleteDelegate[8388609];

    //return;    
}

function ClearRegisterHostStatGuidCompleteDelegateDelegate()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> RegisterHostStatGuidCompleteDelegate[8388609];

    //return;    
}

function GetClientStatGuid()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string ReturnValue[92274689];

    //return ReturnValue;    
}

function RegisterStatGuid()
{
    local /*0x35EA0000-0x00000000*/ private @NULL PlayerID[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize string ClientStatGuid[25296897];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

function CalcAggregateSkill()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize array Mus[8388609], Sigmas;
    local /*0x35EA0000-0x00000000*/ private @NULL OutAggregateMu[25165825], OutAggregateSigma;

    //return;    
}
