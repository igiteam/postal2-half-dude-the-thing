class LPPerkEverlongGrudge extends LPPerkAbility;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL GrudgeTuneData;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL NemesisPRI[536870913];

defaultproperties
{
    PerkName="EverlongGrudge"
    PerkType=EPerkType.PerkType_AbilityPassive
    PerkIndex=EPerks.EPERK_GRUDGE
    HUDIconName="iconEverlongGrudge"
    FriendlyName="Everlong Grudge"
    Description="Ability that shows the location of the last player that killed you."
}