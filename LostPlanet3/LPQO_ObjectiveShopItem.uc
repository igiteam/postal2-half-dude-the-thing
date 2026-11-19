class LPQO_ObjectiveShopItem extends LPQO_ObjectiveBool
    editinlinenew
    hidecategories(Object,Object,UI)
    autoexpandcategories(SPQuestObject_Base,LPQO_ObjectiveShopItem)
    autocollapsecategories(SPQO_Objective);

var(0.25_Pct) /*0x820A0000-0x00000000*/ private @NULL ItemTuneData[65537];
var(0.25_Pct) /*0x820A0000-0x00000000*/ private bool bRepeatablePurchase[65537];
var(0.25_Pct) /*0x820A0000-0x00000000*/ private bool bOverrideCost[65537];
var(0.25_Pct) /*0x820A0000-0x00000000*/ private int OverrideCost[65537];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL DynamicData_ShopItem[536870913];

event ShowStatusChangedUI()
{
    local /*0x97E50000-0x00000000*/ private byte NewStatus[8388609];

    //return;    
}

defaultproperties
{
    Prerequisite=none
    PlayerVisibilityType=EQuestObjectiveVisibilityType.EQOVT_QuestUnlockedAndPrereqsSatisfied
    ProgressTrackingType=EQuestObjectiveProgressTrackingType.EQOPT_QuestUnlockedAndPrereqsSatisfied
    DynamicDataClass=Class'LPQDD_ObjectiveShopItem'
}