class LPSeqAct_SendQuestEvent extends SPSeqAct_SendQuestEvent
    forcescriptorder(true)
    hidecategories(Object,Object);

defaultproperties
{
    // Reference: LPQuestEventSelector'Default__LPSeqAct_SendQuestEvent.EventEntryA'
    begin object name=EventEntryA class=Class'LPQuestEventSelector'
    end object
    EventEntry=EventEntryA
}