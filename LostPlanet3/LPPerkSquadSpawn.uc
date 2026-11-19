class LPPerkSquadSpawn extends LPPerkAbility;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL SquadSpawnTuneData;

defaultproperties
{
    PerkName="SquadSpawn"
    PerkType=EPerkType.PerkType_AbilityPassive
    PerkIndex=EPerks.EPERK_SQUADSPAWN
    HUDIconName="iconSquadSpawn"
    FriendlyName="Squad Spawn"
    Description="Ability that allows you to respawn close to a squad mate."
}