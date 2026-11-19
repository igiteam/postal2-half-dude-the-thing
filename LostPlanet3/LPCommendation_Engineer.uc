class LPCommendation_Engineer extends LPCommendation;

function GetCommendationValueForPlayer()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPPC[8388609];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return float(LPPC.EvalStat('Stat_HealthRepaired', 1));
    //return ReturnValue;    
}
