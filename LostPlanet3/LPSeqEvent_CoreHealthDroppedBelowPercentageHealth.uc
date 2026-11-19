class LPSeqEvent_CoreHealthDroppedBelowPercentageHealth extends LPSeqEvent_CoreTookDamage
    hidecategories(Object);

var(0.25_Pct) /*0x83B20000-0x00000000*/ private float PercentageHealth[65537];

event DoesHitCoreMatch()
{
    local /*0x97E50000-0x00000000*/ private @NULL inPawn[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private float Threshold, prevNormalizedHealth, curNormalizedHealth;

    // End:0x164
    if(super.DoesHitCoreMatch(inPawn))
    {
        Threshold = PercentageHealth / float(100);
        // End:0x4F
        if(Threshold < float(0))
        {
            Threshold = 0.0000000;
        }
        // End:0x6F
        if(Threshold > float(1))
        {
            Threshold = 1.0000000;
        }
        prevNormalizedHealth = inPawn.LastCoreDamagedInfo.PrevHealth / inPawn.GetCoreMaxHealth(CoreTag.GetCoreId());
        curNormalizedHealth = inPawn.GetCoreNormalizedHealth(CoreTag.GetCoreId());
        // End:0x164
        if((prevNormalizedHealth > Threshold) && curNormalizedHealth <= Threshold)
        {
            return true;
        }
    }
    return false;
    //return ReturnValue;    
}

defaultproperties
{
    ObjName="Core Health Dropped Below Percentage (LP)"
}