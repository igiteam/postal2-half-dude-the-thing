class LPSeqAct_UnlockManualPrerequisite extends SPSeqAct_UnlockManualPrerequisite
    forcescriptorder(true)
    hidecategories(Object,Object);

defaultproperties
{
    // Reference: LPQuestObjectSelector'Default__LPSeqAct_UnlockManualPrerequisite.QuestEntryA'
    begin object name=QuestEntryA class=Class'LPQuestObjectSelector'
    end object
    ObjectiveEntry=QuestEntryA
}