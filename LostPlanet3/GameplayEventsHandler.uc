class GameplayEventsHandler extends Object
    abstract
    config(GameStats);

var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array EventIDFilter[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array GroupFilter[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private @NULL Reader[536870913];

function SetReader()
{
    local /*0x35EA0000-0x00000000*/ private @NULL NewReader[8388609];

    Reader = NewReader;
    //return;    
}

// Export UGameplayEventsHandler::execPreProcessStream(FFrame&, void* const)
native event PreProcessStream();

event PostProcessStream()
{
    //return;    
}

event ResolveGroupFilters()
{
    local /*0x35EA0000-0x00000000*/ private int EventIdx, FilterIdx;

    EventIdx = 0;
    J0x0B:

    // End:0x185 [Loop If]
    if(EventIdx < Reader.SupportedEvents.Length)
    {
        FilterIdx = GroupFilter.Find('Group', Reader.SupportedEvents[EventIdx].StatGroup.Group);        
        // End:0x177
        if(FilterIdx != -1)
        {
            // End:0x177
            if(Reader.SupportedEvents[EventIdx].StatGroup.Level > GroupFilter[FilterIdx].Level)
            {
                AddFilter(Reader.SupportedEvents[EventIdx].EventID);
            }
        }
        EventIdx++;
        // [Loop Continue]
        goto J0x0B;
    }
    //return;    
}

function AddFilter()
{
    local /*0x35EA0000-0x00000000*/ private int EventID[8388609];

    // End:0x36
    if(EventIDFilter.Find(EventID) == )
    {        
        EventIDFilter.AddItem(EventID);        
    }
    //return;    
}

function RemoveFilter()
{
    local /*0x35EA0000-0x00000000*/ private int EventID[8388609];

    EventIDFilter.RemoveItem(EventID);    
    //return;    
}
