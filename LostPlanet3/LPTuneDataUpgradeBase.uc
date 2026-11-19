class LPTuneDataUpgradeBase extends SPTuneDataShopItem
    abstract
    hidecategories(Object,Object);

var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL QuestPrerequisite[524289];
var(0.25_Pct) /*0xD3B10000-0x00000000*/ private bool bIsVSUpgrade[65537];

function IsEnabled()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x7A
    if(((QuestPrerequisite != none) && QuestPrerequisite.GetQuestObject() != none) && int(QuestPrerequisite.GetQuestObject().GetQuestStatus()) == int(4))
    {
        return true;
    }
    return HasBeenPurchased();
    //return ReturnValue;    
}

defaultproperties
{
    bIsVSUpgrade=true
    // Reference: LPShopInterface'Default__LPTuneDataUpgradeBase.LPShopInterfaceA'
    begin object name=LPShopInterfaceA class=Class'LPShopInterface'
    end object
    ShopInterface=LPShopInterfaceA
}