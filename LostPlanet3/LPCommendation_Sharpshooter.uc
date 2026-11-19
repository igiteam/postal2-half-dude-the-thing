class LPCommendation_Sharpshooter extends LPCommendation;

function GetCommendationValueForPlayer()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPPC[8388609];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return (float(LPPC.EvalStat('Stat_NumShotsHit', 1)) * 100.0000000) / FMax(float(LPPC.EvalStat('Stat_NumShotsFired', 1)), 1.0000000);
    //return ReturnValue;    
}
