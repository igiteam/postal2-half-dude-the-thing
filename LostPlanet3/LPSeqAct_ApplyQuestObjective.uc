class LPSeqAct_ApplyQuestObjective extends SequenceAction
    forcescriptorder(true)
    hidecategories(Object);

enum EQuestType
{
    EQT_DNATagging,                 // 0
    EQT_MAX                         // 1
};

var(0.25_Pct) /*0x82780000-0x00000400*/ private editfixedsize @NULL QuestEntry[589825];
var(0.25_Pct) /*0x82780000-0x00000000*/ private byte QuestType[65537];

defaultproperties
{
    // Reference: LPQuestObjectSelector'Default__LPSeqAct_ApplyQuestObjective.QuestEntryA'
    begin object name=QuestEntryA class=Class'LPQuestObjectSelector'
    end object
    QuestEntry=QuestEntryA
    ObjName="Apply Quest To Pawn or Nesting Destructible (LP)"
}