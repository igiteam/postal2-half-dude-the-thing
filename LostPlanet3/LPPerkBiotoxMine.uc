class LPPerkBiotoxMine extends LPPerkProximityMine;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL BiotoxTuneData;

simulated function GetPerkTargetActorType()
{
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];

    return BiotoxTuneData.BeaconObjectClass;
    //return ReturnValue;    
}

simulated function GetDeploymentCost()
{
    local /*0x97E50000-0x00000000*/ private bool bRecalculateCost[9437185];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    false
    return 30.0000000;
    //return ReturnValue;    
}

defaultproperties
{
    PerkName="BiotoxMine"
    PerkIndex=EPerks.EPERK_BIOTOXMINE
    HUDIconName="iconBiotoxMine"
    FriendlyName="Biotox Mine"
    Description="When triggered, releases a toxic gas cloud that damages nearby enemies and Akrid."
}