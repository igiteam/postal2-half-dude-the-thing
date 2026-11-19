class LPShopInterface extends SPShopInterface within SPTuneDataShopItem
    editinlinenew
    hidecategories(Object);

var(0.25_Pct) /*0x84400000-0x00000000*/ private editfixedsize string ItemTitle;
var(0.25_Pct) /*0x84400000-0x00000000*/ private editfixedsize string ItemDescription;
var(0.25_Pct) /*0x84400000-0x00000000*/ private int PurchaseCost[65537];
var(0.25_Pct) /*0x84400000-0x00000000*/ private int Quantity[65537];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array UnlockingObjectives[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bCachedUnlockedStatus[536870913];
var(0.25_Pct) /*0x84400000-0x00000000*/ private @NULL ItemIconTexture[65537];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string IconTextureString;
var(0.25_Pct) /*0x84400000-0x00000000*/ private name ShopItemType[65537];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array ShopCategories;

function GetMyTuneData()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    return Outer;
    //return ReturnValue;    
}

function ShouldDisplayInShop()
{
    local /*0x97E50000-0x00000000*/ private @NULL InController[8388609], ShopItem;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private byte ObjStatus;

    ObjStatus = ShopItem.GetQuestStatus();
    // End:0x55
    if((int(ObjStatus) == int(2)) || int(ObjStatus) == int(4))
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

function GetPurchaseCost()
{
    local /*0x97E50000-0x00000000*/ private @NULL InController[8388609], ShopItem;
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];

    // End:0x41
    if(ShopItem.bOverrideCost)
    {
        return ShopItem.OverrideCost;
    }
    return PurchaseCost;
    //return ReturnValue;    
}

function GetQuantity()
{
    local /*0x97E50000-0x00000000*/ private @NULL InController[8388609], ShopItem;
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];

    return Quantity;
    //return ReturnValue;    
}

function GetItemTitle()
{
    local /*0x97E50000-0x00000000*/ private @NULL InController[8388609], ShopItem;
    local /*0x97E50000-0x00000000*/ private editfixedsize string ReturnValue[92274689];

    return ((ItemTitle != "") ? ItemTitle : string(GetMyTuneData().Name));
    //return ReturnValue;    
}

function GetItemDescription()
{
    local /*0x97E50000-0x00000000*/ private @NULL InController[8388609], ShopItem;
    local /*0x97E50000-0x00000000*/ private editfixedsize string ReturnValue[92274689];

    return ItemDescription;
    //return ReturnValue;    
}

function GetCurrencyType()
{
    local /*0x97E50000-0x00000000*/ private @NULL ShopItem[8388609];
    local /*0x97E50000-0x00000000*/ private byte ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL TheShop;

    TheShop = LPQO_Shop(ShopItem.Outer);
    // End:0x5F
    if(TheShop != none)
    {
        return TheShop.currencyType;
    }
    return 0;
    //return ReturnValue;    
}

function CanPurchase()
{
    local /*0x97E50000-0x00000000*/ private @NULL InController[8388609], ShopItem;
    local /*0x97E50000-0x00000000*/ private byte ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL LPPC, MyTuneData;
    local /*0x97E50000-0x00000000*/ private byte Result;
    local /*0x97E50000-0x00000000*/ private int Cost;

    MyTuneData = GetMyTuneData();
    LPPC = LPPlayerController(InController);
    // End:0x77
    if(((ShopItem != none) && !ShopItem.bRepeatablePurchase) && HasBeenPurchased())
    {
        return 4;
    }
    Result = MyTuneData.CanPurchase(InController, GetQuantity(InController, ShopItem));
    // End:0xE3
    if(int(Result) != int(0))
    {
        return Result;
    }
    Cost = GetPurchaseCost(InController, ShopItem);
    // End:0x14E
    if(!LPPC.HasEnoughCurrency(GetCurrencyType(ShopItem), float(Cost)))
    {
        return 1;
    }
    return Result;
    //return ReturnValue;    
}

private final event PurchasedBy()
{
    local /*0x97E50000-0x00000000*/ private @NULL InController[8388609], ShopItem, LPPC, MyTuneData;
    local /*0x97E50000-0x00000000*/ private int FinalCost;

    MyTuneData = GetMyTuneData();
    LPPC = LPPlayerController(InController);
    FinalCost = GetPurchaseCost(InController, ShopItem);
    // End:0xA2
    if(FinalCost > 0)
    {
        LPPC.UsedCurrency(GetCurrencyType(ShopItem), float(FinalCost));
    }
    MyTuneData.PurchasedBy(InController, GetQuantity(InController, ShopItem));
    //return;    
}

// Export ULPShopInterface::execHasBeenPurchased(FFrame&, void* const)
native function HasBeenPurchased()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

defaultproperties
{
    PurchaseCost=1
    Quantity=1
    ShopCategories=/* Array type was not detected. */
}