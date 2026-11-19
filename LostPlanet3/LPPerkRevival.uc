class LPPerkRevival extends LPPerkAbility;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL RevivalTuneData;

simulated function GetRecoveryParams()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL ReturnValue[92274689];

    // End:0x34
    if((IsAssigned()) >= 0)
    {
        return RevivalTuneData.RecoveryParameters[1];        
    }
    else
    {
        return RevivalTuneData.RecoveryParameters[0];
    }
    //return ReturnValue;    
}

defaultproperties
{
    PerkName="Revival"
    PerkType=EPerkType.PerkType_AbilityPassive
    PerkIndex=EPerks.EPERK_REVIVAL
    HUDIconName="iconRevive"
    FriendlyName="Enhanced Revive"
    Description="Makes teammate revival instantaneous, increases teammate starting health, and gives bonus T-ENG rewards."
}