class LPCommendation_CautiousType extends LPCommendation;

function GetCommendationValueForPlayer()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPPC[8388609];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return (((LPPC.EvalStat('Stat_Deaths', 1) == 0) && LPPC.EvalStat('Stat_KillsHuman', 1) == 0) ? 1.0000000 : 0.0000000);
    //return ReturnValue;    
}
