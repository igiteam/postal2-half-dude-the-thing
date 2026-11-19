class SeqEvent_RemoteEvent extends SequenceEvent
    hidecategories(Object);

var(*) /*0x44780000-0x00000000*/ private name EventName[65537];
var(*) /*0x35EA0000-0x00000000*/ private bool bStatusIsOk[536870913];

static event GetObjClassVersion()
{
    local /*0x35EA0000-0x00000000*/ private int ReturnValue[92274689];

    return super(SequenceObject).GetObjClassVersion() + 1;
    //return ReturnValue;    
}

defaultproperties
{
    EventName="DefaultEvent"
    MaxTriggerCount=0
    bPlayerOnly=false
    ObjName="Remote Event"
}