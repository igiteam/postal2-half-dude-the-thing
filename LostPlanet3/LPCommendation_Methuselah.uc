class LPCommendation_Methuselah extends LPCommendation;

function GetCommendationValueForPlayer()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPPC[8388609];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private int LongestLifespan;

    LongestLifespan = LPPC.EvalStat('Stat_LongestLifespan', 1);
    return ((LongestLifespan == 0) ? float(2147483647) : float(LongestLifespan));
    //return ReturnValue;    
}
