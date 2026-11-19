class LPCommendation_Scout extends LPCommendation;

function GetCommendationValueForPlayer()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPPC[8388609];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private editfixedsize array EmblemList;
    local /*0x97E50000-0x00000000*/ private int TotalEmblemsAwarded;
    local /*0x97E50000-0x00000000*/ private @NULL Award;

    TotalEmblemsAwarded = 0;
    EmblemList = LPPC.GetAwardManager().GetAwardsOfClass(Class'LPEmblem');
    // End:0xB6
    foreach EmblemList(Award)
    {
        TotalEmblemsAwarded += LPEmblem(Award).GetTimesAwardedStat().Evaluate(1);        
    }    
    return float(TotalEmblemsAwarded);
    //return ReturnValue;    
}
