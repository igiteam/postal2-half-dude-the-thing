class LPPerkCreditBooster extends LPPerkAbility;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CreditBoosterTuneData;

// Export ULPPerkCreditBooster::execGetAdjustedCredits(FFrame&, void* const)
native final simulated function GetAdjustedCredits()
{
    local /*0x97E50000-0x00000000*/ private int BaseCredits[8388609], ReturnValue;


}

defaultproperties
{
    PerkName="CreditBooster"
    PerkType=EPerkType.PerkType_AbilityPassive
    PerkIndex=EPerks.EPERK_CREDITBOOSTER
    HUDIconName="iconCreditBoost"
    FriendlyName="Credit Booster"
    Description="Ability that boosts your credits earned total by 25 % during the Match Summary."
}