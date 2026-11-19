class AnalyticEventsBase extends PlatformInterfaceBase
    transient;

struct native EventStringParam
{
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string ParamName;
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string ParamValue;

    structdefaultproperties
    {
        ParamName=""
        ParamValue=""
    }
};

var(*) /*0x35EA0000-0x00000000*/ private bool bSessionInProgress[131073];

function IsSessionInProgress()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    return bSessionInProgress;
    //return ReturnValue;    
}

// Export UAnalyticEventsBase::execInit(FFrame&, void* const)
native event Init();

// Export UAnalyticEventsBase::execStartSession(FFrame&, void* const)
native event StartSession();

// Export UAnalyticEventsBase::execEndSession(FFrame&, void* const)
native event EndSession();

// Export UAnalyticEventsBase::execLogStringEvent(FFrame&, void* const)
native event LogStringEvent()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string EventName[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bTimed[8388609];


}

// Export UAnalyticEventsBase::execEndStringEvent(FFrame&, void* const)
native event EndStringEvent()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string EventName[8388609];


}

// Export UAnalyticEventsBase::execLogStringEventParam(FFrame&, void* const)
native event LogStringEventParam()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string EventName[8388609], ParamName, ParamValue;
    local /*0x35EA0000-0x00000000*/ private bool bTimed[8388609];


}

// Export UAnalyticEventsBase::execEndStringEventParam(FFrame&, void* const)
native event EndStringEventParam()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string EventName[8388609], ParamName, ParamValue;


}

// Export UAnalyticEventsBase::execLogStringEventParamArray(FFrame&, void* const)
native event LogStringEventParamArray()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string EventName[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize array ParamArray[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bTimed[8388609];


}

// Export UAnalyticEventsBase::execEndStringEventParamArray(FFrame&, void* const)
native event EndStringEventParamArray()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string EventName[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize array ParamArray[8388609];


}

// Export UAnalyticEventsBase::execLogErrorMessage(FFrame&, void* const)
native event LogErrorMessage()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string ErrorName[8388609], ErrorMessage;


}
