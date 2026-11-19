class LPPerkRepair extends LPPerkAbility;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL RepairTuneData;

defaultproperties
{
    PerkName="Repair"
    PerkType=EPerkType.PerkType_AbilityPassive
    PerkIndex=EPerks.EPERK_REPAIR
    HUDIconName="iconRepair"
    FriendlyName="Enhanced Repair"
    Description="Restore health to mechanical objects, neutralize the effects of EMP, and view mechanical object health from a distance."
}