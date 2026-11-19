class LPSeqEvent_TimerExpired extends SequenceEvent
    forcescriptorder(true)
    hidecategories(Object);

event Activated()
{
    OutputLinks[0].bHasImpulse = true;
    //return;    
}

defaultproperties
{
    MaxTriggerCount=0
    bPlayerOnly=false
    ObjName="MP GameTimer Expired (LP)"
}