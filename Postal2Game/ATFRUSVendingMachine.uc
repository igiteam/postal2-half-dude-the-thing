/**
 * ATFRUSVendingMachine
 *
 * Preset vending machines owned by ATF R US placed around town that sells
 * basic weapons that civilians can own, like grenades!
 */
class ATFRUSVendingMachine extends P2EVendingMachineTrigger;


// Decompiled with UE Explorer.
defaultproperties
{
    ItemList[0]=(ItemPickup=Class'Inventory.PistolPickup',ItemName="Old Faithful Combat Pistol",ItemDescription="Homies trippin? Bust a cap in they ass!",ItemIcon=Texture'HUDPack.Icons.Icon_Weapon_Pistol',ItemBuyRate=(ItemPrice=20))
    ItemList[1]=(ItemPickup=Class'Inventory.PistolAmmoPickup',ItemName="Pistol Cartridges",ItemDescription=".50 caliber cartridges",ItemIcon=Texture'HUDPack.Icons.Icon_Weapon_Pistol',ItemBuyRate=(ItemPrice=20,ItemAmount=20),ItemSellRate=(ItemPrice=10,ItemAmount=20))
    ItemList[2]=(ItemPickup=Class'Inventory.ShotGunPickup',ItemName="Mansweeper Riot Gun",ItemDescription="Angry mob got you in their sights? Teach'em the Mansweeper way!",ItemIcon=Texture'HUDPack.Icons.Icon_Weapon_Shotgun',ItemBuyRate=(ItemPrice=30))
    ItemList[3]=(ItemPickup=Class'Inventory.ShotgunAmmoPickup',ItemName="Shotgun Shells",ItemDescription="12 Gauge Shotgun Shells",ItemIcon=Texture'HUDPack.Icons.Icon_Weapon_Shotgun',ItemBuyRate=(ItemPrice=20,ItemAmount=12),ItemSellRate=(ItemPrice=10,ItemAmount=12))
    ItemList[4]=(ItemPickup=Class'Inventory.MachineGunPickup',ItemName="Machine Gun",ItemDescription="Come on. You know you wanna",ItemIcon=Texture'HUDPack.Icons.Icon_Weapon_Machinegun',ItemBuyRate=(ItemPrice=40))
    ItemList[5]=(ItemPickup=Class'Inventory.MachinegunAmmoPickup',ItemName="MachineGun Cartridges",ItemDescription="5.56x45mm cartridges",ItemIcon=Texture'HUDPack.Icons.Icon_Weapon_Machinegun',ItemBuyRate=(ItemPrice=15,ItemAmount=25),ItemSellRate=(ItemPrice=7,ItemAmount=25))
    ItemList[6]=(ItemPickup=Class'Inventory.RiflePickup',ItemName="Pappy's Pride Hunting Rifle",ItemIcon=Texture'HUDPack.Icons.Icon_Weapon_Rifle',ItemBuyRate=(ItemPrice=100))
    ItemList[7]=(ItemPickup=Class'Inventory.RifleAmmoPickup',ItemName="Rifle Cartridges",ItemDescription=".30-06 cartridges",ItemIcon=Texture'HUDPack.Icons.Icon_Weapon_Rifle',ItemBuyRate=(ItemPrice=70,ItemAmount=7),ItemSellRate=(ItemPrice=35,ItemAmount=7))
    ItemList[8]=(ItemPickup=Class'Inventory.GrenadePickup',ItemName="Grenades",ItemDescription="One-step Stump Remover\\n\\nWARNING: Not for consumption",ItemIcon=Texture'HUDPack.Icons.Icon_Weapon_Grenade',ItemBuyRate=(ItemPrice=40,ItemAmount=4),ItemSellRate=(ItemPrice=20,ItemAmount=4),bWeaponIsAlsoAmmo=true)
    Song="mall_muzak1.ogg"
}