class LPSeqAct_AdjustQuestObjectiveProgress extends SPSeqAct_AdjustQuestObjectiveProgress
    forcescriptorder(true)
    hidecategories(Object,Object);

var(0.25_Pct) /*0x825D0000-0x00000000*/ private bool bForceShopItemToBeFree[65537];

defaultproperties
{
    // Reference: LPQuestObjectSelector'Default__LPSeqAct_AdjustQuestObjectiveProgress.ObjectiveEntryA'
    begin object name=ObjectiveEntryA class=Class'LPQuestObjectSelector'
    end object
    ObjectiveEntry=ObjectiveEntryA
}