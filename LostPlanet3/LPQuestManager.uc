class LPQuestManager extends SPQuestManager;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bBestiaryTrackHack[536870913];

// Export ULPQuestManager::execDebugDraw(FFrame&, void* const)
native function DebugDraw()
{
    local /*0x97E50000-0x00000000*/ private @NULL InCanvas[8388609];


}

defaultproperties
{
    // Reference: LPQuestTuneDataContainer'Default__LPQuestManager.QuestContainer'
    begin object name=QuestContainer class=Class'LPQuestTuneDataContainer'
    end object
    QuestTuneDataContainer=QuestContainer
}