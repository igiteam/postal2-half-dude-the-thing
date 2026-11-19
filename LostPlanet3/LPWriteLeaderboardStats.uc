class LPWriteLeaderboardStats extends OnlineStatsWrite
    abstract;

function SetValue()
{
    local /*0x97E50000-0x00000000*/ private int Value[8388609];

    SetInt64Stat(Properties[0].PropertyId, Value);
    //return;    
}
