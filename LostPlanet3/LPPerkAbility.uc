class LPPerkAbility extends LPPerkBase;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL AbilityTuneData;

simulated function GetCost()
{
    local /*0x97E50000-0x00000000*/ private bool bRecalculateCost[9437185];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    false
    return GetCapacityCost(bRecalculateCost);
    //return ReturnValue;    
}

simulated function GetCapacityCost()
{
    local /*0x97E50000-0x00000000*/ private bool bRecalculateCost[9437185];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    false
    return GetAbilityTuneData().CapacityCost.GetValue(MyPlayerController, bRecalculateCost);
    //return ReturnValue;    
}

simulated function GetAbilityTuneData()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    // End:0x2C
    if(AbilityTuneData == none)
    {
        AbilityTuneData = LPTuneDataPerkAbilityBase(GetTuneData());
    }
    return AbilityTuneData;
    //return ReturnValue;    
}
