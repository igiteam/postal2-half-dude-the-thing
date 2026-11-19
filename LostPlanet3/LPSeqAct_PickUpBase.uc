class LPSeqAct_PickUpBase extends SequenceAction
    abstract
    forcescriptorder(true)
    hidecategories(Object);

var(0.25_Pct) /*0x82F60000-0x00000400*/ private editfixedsize @NULL QuestEntry[589825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name SoundEventName;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name FXEventName;

function PickedUpItem()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPP[8388609], Objective;

    // End:0x11
    if(LPP == none)
    {
        return;
    }
    // End:0x86
    if(QuestEntry != none)
    {
        Objective = SPQO_ObjectiveBool(QuestEntry.GetQuestObject());
        // End:0x86
        if(Objective != none)
        {
            Objective.AdjustQuestProgress(1.0000000);
        }
    }
    // End:0xEF
    if(SoundEventName != 'None')
    {
        LPP.TuneDataPawnSoundEventBindings.PlayEventSoundLocally(SoundEventName, 'None', LPP, none, none);
    }
    // End:0x16B
    if(FXEventName != 'None')
    {
        LPP.TuneDataPawnFXEventBindings.PlayEventFX(FXEventName, LPP, LPP.Mesh, none);
    }
    //return;    
}

defaultproperties
{
    // Reference: LPQuestObjectSelector'Default__LPSeqAct_PickUpBase.QuestEntryA'
    begin object name=QuestEntryA class=Class'LPQuestObjectSelector'
    end object
    QuestEntry=QuestEntryA
    ObjName=""
}