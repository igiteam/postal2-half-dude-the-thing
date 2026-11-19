class LPSeqEvent_CoreTookDamage extends SequenceEvent
    forcescriptorder(true)
    hidecategories(Object);

var(0.25_Pct) /*0x271D0000-0x00000400*/ private editfixedsize @NULL CoreTag[589825];

event DoesHitCoreMatch()
{
    local /*0x97E50000-0x00000000*/ private @NULL inPawn[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL hitCoreTag;

    hitCoreTag = inPawn.LastCoreDamagedInfo.CoreTag;
    // End:0xD2
    if(hitCoreTag != none)
    {
        // End:0xD2
        if((hitCoreTag.Class == CoreTag.Class) && hitCoreTag.GetCoreId() == CoreTag.GetCoreId())
        {
            return true;
        }
    }
    return false;
    //return ReturnValue;    
}

defaultproperties
{
    MaxTriggerCount=0
    bPlayerOnly=false
    ObjName="Core Damaged (LP)"
}