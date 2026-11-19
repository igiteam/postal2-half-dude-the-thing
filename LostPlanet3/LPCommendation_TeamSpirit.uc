class LPCommendation_TeamSpirit extends LPCommendation;

function GetCommendationValueForPlayer()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPPC[8388609];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private editfixedsize array EmblemList;
    local /*0x97E50000-0x00000000*/ private int TotalSupportEmblemsAwarded;
    local /*0x97E50000-0x00000000*/ private @NULL Award;

    TotalSupportEmblemsAwarded = 0;
    EmblemList = LPPC.GetAwardManager().GetAwardsOfClass(Class'LPEmblem_Support');
    // End:0xB6
    foreach EmblemList(Award)
    {
        TotalSupportEmblemsAwarded += LPEmblem(Award).GetTimesAwardedStat().Evaluate(1);        
    }    
    return float(TotalSupportEmblemsAwarded);
    //return ReturnValue;    
}
