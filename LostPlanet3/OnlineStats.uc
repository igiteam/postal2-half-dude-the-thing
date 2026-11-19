class OnlineStats extends Object
    abstract;

var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array ViewIdMappings[131073];

// Export UOnlineStats::execGetViewId(FFrame&, void* const)
native function GetViewId()
{
    local /*0x35EA0000-0x00000000*/ private name ViewName[8388609];
    local /*0x35EA0000-0x00000000*/ private int ViewId[25165825];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UOnlineStats::execGetViewName(FFrame&, void* const)
native function GetViewName()
{
    local /*0x35EA0000-0x00000000*/ private int ViewId[8388609];
    local /*0x35EA0000-0x00000000*/ private name ReturnValue[92274689];


}
