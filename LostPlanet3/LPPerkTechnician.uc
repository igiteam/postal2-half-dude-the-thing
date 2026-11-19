class LPPerkTechnician extends LPPerkAbility;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TechnicianTuneData;

defaultproperties
{
    PerkName="Technician"
    PerkType=EPerkType.PerkType_AbilityPassive
    PerkIndex=EPerks.EPERK_TECHNICIAN
    HUDIconName="iconTechnician"
    FriendlyName="Technician"
    Description="Ability that increases deployment speeds."
}