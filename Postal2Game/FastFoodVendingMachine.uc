/**
 * FastFoodVendingMachine
 *
 * Vending machine that sells donuts, pizza, and fast food. 'MERICA!
 */
class FastFoodVendingMachine extends P2EVendingMachineTrigger;


// Decompiled with UE Explorer.
defaultproperties
{
    ItemList[0]=(ItemPickup=Class'Inventory.DonutPickup',ItemName="Lucky Hole Doughnuts",ItemDescription="Sweetest hole your tongue will ever be in",ItemIcon=Texture'HUDPack.Icons.Icon_Inv_Doughnut',ItemBuyRate=(ItemPrice=5,ItemAmount=1),ItemSellRate=(ItemPrice=2,ItemAmount=1))
    ItemList[1]=(ItemPickup=Class'Inventory.PizzaPickup',ItemName="Pizza Shovel Slice",ItemDescription="Now with actual cheese!\\nMmmm... chewy!",ItemIcon=Texture'HUDPack.Icons.Icon_Inv_Pizza',ItemBuyRate=(ItemPrice=10,ItemAmount=1),ItemSellRate=(ItemPrice=5,ItemAmount=1))
    ItemList[2]=(ItemPickup=Class'Inventory.FastFoodPickup',ItemName="Coronary Burger Meal",ItemDescription="Eat your heart out! Does your heart good!*\\n\\n*blatant lie",ItemIcon=Texture'HUDPack.Icons.Icon_Inv_Food',ItemBuyRate=(ItemPrice=20,ItemAmount=1),ItemSellRate=(ItemPrice=10,ItemAmount=1))
    Background=Texture'Timb.sign.7th_heaven'
    Song="restaurant_muzak.ogg"
}