class LPMapInfoEventList extends Object
    editinlinenew
    hidecategories(Object);

struct TSortedList
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private int EventIndex;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float AbsoluteTime;

    structdefaultproperties
    {
        EventIndex=0
        AbsoluteTime=0.0000000
    }
};

var(0.25_Pct) /*0x54CF0000-0x00000400*/ private editfixedsize array EventList[589825];
var(0.25_Pct) /*0x54CF0000-0x00000000*/ private int JoinLateSearchCount[65537];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array SortedEventIndexes;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int CurrentEventIndex;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bFirstUpdateLoop;
//var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> __EventListSort__Delegate;

delegate EventListSort()
{
    local /*0x97E50000-0x00000000*/ private @NULL A[8388609], B;
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];

    return ((A.AbsoluteTime > B.AbsoluteTime) ? -1 : 0);
    //return ReturnValue;    
}

function Init()
{
    local /*0x97E50000-0x00000000*/ private float CurrentGameTime[8388609];

    bFirstUpdateLoop = true;
    //return;    
}

function TriggerEvent()
{
    local /*0x97E50000-0x00000000*/ private name EventName[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL GameSeq;
    local /*0x97E50000-0x00000000*/ private editfixedsize array AllSeqEvents, ActivateIndices;
    local /*0x97E50000-0x00000000*/ private int I;
    local /*0x97E50000-0x00000000*/ private @NULL WI;

    WI = Class'Engine.WorldInfo'.static.GetWorldInfo();
    GameSeq = WI.GetGameSequence();
    // End:0x158
    if(GameSeq != none)
    {
        GameSeq.FindSeqObjectsByClass(Class'Engine.SeqEvent_RemoteEvent', true, AllSeqEvents);
        ActivateIndices[0] = 0;
        I = 0;
        J0xAC:

        // End:0x158 [Loop If]
        if(I < AllSeqEvents.Length)
        {
            // End:0x14A
            if(SeqEvent_RemoteEvent(AllSeqEvents[I]).EventName == EventName)
            {
                SeqEvent_RemoteEvent(AllSeqEvents[I]).CheckActivate(WI, none, false, ActivateIndices);
            }
            I++;
            // [Loop Continue]
            goto J0xAC;
        }
    }
    //return;    
}

function DoTriggerCheck()
{
    local /*0x97E50000-0x00000000*/ private float CurrentGameTime[8388609];
    local /*0x97E50000-0x00000000*/ private bool bInitialCheck[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ev;
    local /*0x97E50000-0x00000000*/ private int I, J;

    true
    I = 0;
    J0x10:

    // End:0x6D [Loop If]
    if(I < SortedEventIndexes.Length)
    {
        // End:0x5F
        if(SortedEventIndexes[I].AbsoluteTime > CurrentGameTime)
        {
            // [Explicit Break]
            goto J0x6D;
        }
        ++I;
        // [Loop Continue]
        goto J0x10;
    }
    J0x6D:

    CurrentEventIndex = I;
    --I;
    // End:0xB2
    if(CurrentEventIndex >= SortedEventIndexes.Length)
    {
        CurrentEventIndex = -1;
    }
    // End:0xE5
    if((!bInitialCheck || I <= 0) || JoinLateSearchCount <= 0)
    {
        return;
    }
    J = 0;
    J0xF0:

    // End:0x1B5 [Loop If]
    if(J < JoinLateSearchCount)
    {
        ev = EventList[SortedEventIndexes[I - J].EventIndex];
        // End:0x15D
        if(ev == none)
        {
            return;
        }
        // End:0x1A7
        if(ev.bTriggerWhenAttachingLate)
        {
            TriggerEvent(ev.EventName);
        }
        ++J;
        // [Loop Continue]
        goto J0xF0;
    }
    //return;    
}

function BuildSortedEventList()
{
    local /*0x97E50000-0x00000000*/ private @NULL ev, Sl;
    local /*0x97E50000-0x00000000*/ private int I;

    SortedEventIndexes.Length = 0;
    I = 0;
    // End:0xB2
    foreach EventList(ev)
    {
        Sl.EventIndex = I;
        Sl.AbsoluteTime = ev.GetAbsoluteTime();
        SortedEventIndexes.AddItem(Sl);        
        I++;        
    }    
    SortedEventIndexes.Sort(EventListSort);    
    CurrentEventIndex = ((SortedEventIndexes.Length > 0) ? 0 : -1);
    //return;    
}

function Update()
{
    local /*0x97E50000-0x00000000*/ private float CurrentGameTime[8388609];
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL ev;

    // End:0x37
    if(bFirstUpdateLoop)
    {
        BuildSortedEventList();
        DoTriggerCheck(CurrentGameTime);
        bFirstUpdateLoop = false;
    }
    // End:0x48
    if(CurrentEventIndex < 0)
    {
        return 0;
    }
    // End:0x7E
    if(SortedEventIndexes[CurrentEventIndex].AbsoluteTime > CurrentGameTime)
    {
        return 0;
    }
    ev = EventList[SortedEventIndexes[CurrentEventIndex].EventIndex];
    // End:0xD8
    if(ev == none)
    {
        CurrentEventIndex = -1;
        return 0;
    }
    TriggerEvent(ev.EventName);
    ++CurrentEventIndex;
    // End:0x132
    if(CurrentEventIndex >= SortedEventIndexes.Length)
    {
        CurrentEventIndex = -1;
    }
    return 1;
    //return ReturnValue;    
}

function StartMatch()
{
    // End:0x1E
    if(SortedEventIndexes.Length > 0)
    {
        CurrentEventIndex = 0;        
    }
    else
    {
        CurrentEventIndex = -1;
        return;
    }
    //return;    
}

function EndMatch()
{
    CurrentEventIndex = -1;
    //return;    
}

function RestartMatch()
{
    StartMatch();
    //return;    
}

defaultproperties
{
    JoinLateSearchCount=1
    CurrentEventIndex=-1
    bFirstUpdateLoop=true
}