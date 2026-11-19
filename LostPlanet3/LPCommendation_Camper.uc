class LPCommendation_Camper extends LPCommendation;

function CompareCommendationValues()
{
    local /*0x97E50000-0x00000000*/ private float NewValue[8388609], CurValue;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return (NewValue >= float(0)) && (NewValue < CurValue) || CurValue < float(0);
    //return ReturnValue;    
}

function GetCommendationValueForPlayer()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPPC[8388609];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return float(LPPC.EvalStat('Stat_DistanceTraveled', 1));
    //return ReturnValue;    
}

defaultproperties
{
    DefaultCompareValue=-1.0000000
}