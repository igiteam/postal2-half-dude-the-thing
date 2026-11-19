class OnlineStatsWrite extends OnlineStats
    abstract;

var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array StatMappings[131073];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array Properties[131073];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array ViewIds;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array ArbitratedViewIds;
var(*) /*0x35EA0000-0x00000000*/ private int RatingId[131073];
//var(*) /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> __OnStatsWriteComplete__Delegate;

delegate OnStatsWriteComplete()
{
    //return;    
}

// Export UOnlineStatsWrite::execGetStatId(FFrame&, void* const)
native function GetStatId()
{
    local /*0x35EA0000-0x00000000*/ private name StatName[8388609];
    local /*0x35EA0000-0x00000000*/ private int StatId[25165825];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UOnlineStatsWrite::execGetStatName(FFrame&, void* const)
native function GetStatName()
{
    local /*0x35EA0000-0x00000000*/ private int StatId[8388609];
    local /*0x35EA0000-0x00000000*/ private name ReturnValue[92274689];


}

// Export UOnlineStatsWrite::execSetFloatStat(FFrame&, void* const)
native function SetFloatStat()
{
    local /*0x35EA0000-0x00000000*/ private int StatId[8388609];
    local /*0x35EA0000-0x00000000*/ private float Value[8388609];


}

// Export UOnlineStatsWrite::execSetIntStat(FFrame&, void* const)
native function SetIntStat()
{
    local /*0x35EA0000-0x00000000*/ private int StatId[8388609], Value;


}

// Export UOnlineStatsWrite::execSetInt64Stat(FFrame&, void* const)
native function SetInt64Stat()
{
    local /*0x35EA0000-0x00000000*/ private int StatId[8388609], Value;


}

// Export UOnlineStatsWrite::execIncrementFloatStat(FFrame&, void* const)
native function IncrementFloatStat()
{
    local /*0x35EA0000-0x00000000*/ private int StatId[8388609];
    local /*0x35EA0000-0x00000000*/ private float IncBy[9437185];

    1.0000000                
}

// Export UOnlineStatsWrite::execIncrementIntStat(FFrame&, void* const)
native function IncrementIntStat()
{
    local /*0x35EA0000-0x00000000*/ private int StatId[8388609], IncBy;

    1                
}

// Export UOnlineStatsWrite::execDecrementFloatStat(FFrame&, void* const)
native function DecrementFloatStat()
{
    local /*0x35EA0000-0x00000000*/ private int StatId[8388609];
    local /*0x35EA0000-0x00000000*/ private float DecBy[9437185];

    1.0000000                
}

// Export UOnlineStatsWrite::execDecrementIntStat(FFrame&, void* const)
native function DecrementIntStat()
{
    local /*0x35EA0000-0x00000000*/ private int StatId[8388609], DecBy;

    1                
}
