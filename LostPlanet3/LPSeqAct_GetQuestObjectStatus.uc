class LPSeqAct_GetQuestObjectStatus extends SPSeqAct_GetQuestObjectStatus
    forcescriptorder(true)
    hidecategories(Object,Object);

defaultproperties
{
    // Reference: LPQuestObjectSelector'Default__LPSeqAct_GetQuestObjectStatus.QuestEntryA'
    begin object name=QuestEntryA class=Class'LPQuestObjectSelector'
    end object
    QuestEntry=QuestEntryA
}