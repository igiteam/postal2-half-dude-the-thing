class LPCommendation_EagleScout extends LPCommendation;

function GetCommendationValueForPlayer()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPPC[8388609];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private editfixedsize array EmblemList;
    local /*0x97E50000-0x00000000*/ private int TotalEmblemTypesAwarded;
    local /*0x97E50000-0x00000000*/ private @NULL Award;

    TotalEmblemTypesAwarded = 0;
    EmblemList = LPPC.GetAwardManager().GetAwardsOfClass(Class'LPEmblem');
    // End:0xC0
    foreach EmblemList(Award)
    {
        TotalEmblemTypesAwarded += ((LPEmblem(Award).GetTimesAwardedStat().Evaluate(1) > 0) ? 1 : 0);        
    }    
    return float(TotalEmblemTypesAwarded);
    //return ReturnValue;    
}
