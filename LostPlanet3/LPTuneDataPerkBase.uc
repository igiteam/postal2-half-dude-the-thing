class LPTuneDataPerkBase extends SPTuneDataShopItem
    editinlinenew
    hidecategories(Object,Object);

var(0.25_Pct) /*0xD0BE0000-0x00000000*/ private name UnlockName[65537];
var(0.25_Pct) /*0xB7DF0000-0x00000000*/ private bool bPurchasableInShop[65537];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private class OwningPerkClass;
var(0.25_Pct) /*0x68130000-0x00000000*/ private @NULL HUDIconTexture[65537];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array PerkUpgrades[536870913];

function IsUnlocked()
{
    local /*0x97E50000-0x00000000*/ private @NULL InController[8388609];
    local /*0x97E50000-0x00000000*/ private bool bForceMPCheck[9437185], ReturnValue;

    // End:0x94
    if(bForceMPCheck || (InController != none) && int(InController.WorldInfo.NetMode) != int(NM_Standalone))
    {
        return LPPlayerController(InController).IsUnlockedMP(UnlockName);        
    }
    else
    {
        return HasBeenPurchased();
    }
    //return ReturnValue;    
}

defaultproperties
{
    // Reference: LPShopInterface'Default__LPTuneDataPerkBase.LPShopInterfaceA'
    begin object name=LPShopInterfaceA class=Class'LPShopInterface'
    end object
    ShopInterface=LPShopInterfaceA
}