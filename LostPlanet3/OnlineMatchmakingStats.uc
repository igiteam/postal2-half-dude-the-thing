class OnlineMatchmakingStats extends Object;

struct native MMStats_Timer
{
    var(*) /*0x35EA0000-0x00000000*/ private bool bInProgress;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL MSecs;

    structdefaultproperties
    {
        bInProgress=false
        MSecs=none
    }
};

// Export UOnlineMatchmakingStats::execStartTimer(FFrame&, void* const)
native function StartTimer()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Timer[25165825];


}

// Export UOnlineMatchmakingStats::execStopTimer(FFrame&, void* const)
native function StopTimer()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Timer[25165825];


}
