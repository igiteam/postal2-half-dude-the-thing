class LPLoadoutKitSerializableData extends SPSerializableDynamicData;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string LoadoutName;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string Perk_Slot0;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string Perk_Slot1;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string Perk_Slot2;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string Perk_Slot3;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string WeaponPrimary;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string WeaponSecondary;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string WeaponTertiary;

defaultproperties
{
    WeaponPrimary="LostPlanetGameContent.LPWeaponYammerContent"
    WeaponSecondary="LostPlanetGameContent.LPWeaponCrossbowContent"
    WeaponTertiary="LostPlanetGameContent.LPWeaponGrenadeMPContent"
}