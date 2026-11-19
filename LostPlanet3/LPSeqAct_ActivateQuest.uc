class LPSeqAct_ActivateQuest extends SPSeqAct_ActivateQuest
    forcescriptorder(true)
    hidecategories(Object,Object);

defaultproperties
{
    // Reference: LPQuestObjectSelector'Default__LPSeqAct_ActivateQuest.QuestEntryA'
    begin object name=QuestEntryA class=Class'LPQuestObjectSelector'
    end object
    QuestEntry=QuestEntryA
}