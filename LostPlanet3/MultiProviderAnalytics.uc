class MultiProviderAnalytics extends AnalyticEventsBase
    transient
    config(Engine);

var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array AnalyticsProviderClassNames[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array AnalyticsProviders[536870913];

function Init()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string AnalyticsClassStr;
    local /*0x35EA0000-0x00000000*/ private class AnalyticsClass;
    local /*0x35EA0000-0x00000000*/ private @NULL Analytics;

    // End:0xB3
    foreach AnalyticsProviderClassNames(AnalyticsClassStr)
    {
        AnalyticsClass = class<AnalyticEventsBase>(DynamicLoadObject(AnalyticsClassStr, Class'Core.Class'));
        // End:0xB2
        if(AnalyticsClass != none)
        {
            Analytics = new AnalyticsClass;
            // End:0xB2
            if(Analytics != none)
            {
                Analytics.Init();
                AnalyticsProviders.AddItem(Analytics);                
            }
        }        
    }    
    //return;    
}

// Export UMultiProviderAnalytics::execStartSession(FFrame&, void* const)
native event StartSession();

// Export UMultiProviderAnalytics::execEndSession(FFrame&, void* const)
native event EndSession();

// Export UMultiProviderAnalytics::execLogStringEvent(FFrame&, void* const)
native event LogStringEvent()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string EventName[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bTimed[8388609];


}

// Export UMultiProviderAnalytics::execEndStringEvent(FFrame&, void* const)
native event EndStringEvent()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string EventName[8388609];


}

// Export UMultiProviderAnalytics::execLogStringEventParam(FFrame&, void* const)
native event LogStringEventParam()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string EventName[8388609], ParamName, ParamValue;
    local /*0x35EA0000-0x00000000*/ private bool bTimed[8388609];


}

// Export UMultiProviderAnalytics::execEndStringEventParam(FFrame&, void* const)
native event EndStringEventParam()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string EventName[8388609], ParamName, ParamValue;


}

// Export UMultiProviderAnalytics::execLogStringEventParamArray(FFrame&, void* const)
native event LogStringEventParamArray()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string EventName[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize array ParamArray[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bTimed[8388609];


}

// Export UMultiProviderAnalytics::execEndStringEventParamArray(FFrame&, void* const)
native event EndStringEventParamArray()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string EventName[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize array ParamArray[8388609];


}

// Export UMultiProviderAnalytics::execLogErrorMessage(FFrame&, void* const)
native event LogErrorMessage()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string ErrorName[8388609], ErrorMessage;


}
