class LPSeqEvent_CoreDestroyed extends LPSeqEvent_CoreTookDamage
    hidecategories(Object);

event DoesHitCoreMatch()
{
    local /*0x97E50000-0x00000000*/ private @NULL inPawn[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL hitCoreTag;

    hitCoreTag = inPawn.LastCoreDestroyedInfo.CoreTag;
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
    ObjName="Core Destroyed (LP)"
}