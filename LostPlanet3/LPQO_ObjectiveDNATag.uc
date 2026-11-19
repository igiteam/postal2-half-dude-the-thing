class LPQO_ObjectiveDNATag extends LPQO_ObjectiveBool
    editinlinenew
    hidecategories(Object,Object)
    autoexpandcategories(SPQuestObject_Base,LPQO_ObjectiveDNATag)
    autocollapsecategories(SPQO_Objective);

var(0.25_Pct) /*0x82060000-0x00000000*/ private bool bIncludeInBestiary[65537];
var(0.25_Pct) /*0x82060000-0x00000000*/ private byte BestiaryCategory[65537];
var(0.25_Pct) /*0x82060000-0x00000000*/ private @NULL ItemIconTexture[65537];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string IconTextureString;

event ShowStatusChangedUI()
{
    local /*0x97E50000-0x00000000*/ private byte NewStatus[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL LP, LPPC, GameDataStore;
    local /*0x97E50000-0x00000000*/ private editfixedsize array LocalQuestCache;
    local /*0x97E50000-0x00000000*/ private @NULL QM, Q;
    local /*0x97E50000-0x00000000*/ private int QuestIdx, ObjectiveIdx;
    local /*0x97E50000-0x00000000*/ private @NULL ObjectiveObj;

    super.ShowStatusChangedUI(NewStatus);
    // End:0x33B
    if((int(NewStatus) == int(4)) && bShowCompletedMessage)
    {
        GameDataStore = SPDataStorePersistentGameData(Class'Engine.UIRoot'.static.StaticResolveDataStore(Class'SPEngine.SPDataStorePersistentGameData'.default.Tag));
        // End:0x33B
        if(GameDataStore.QuestManager != none)
        {
            QM = GameDataStore.QuestManager;
            QM.QuestTuneDataContainer.GetAllQuestsInChain('DNATagging', LocalQuestCache);
            QuestIdx = 0;
            J0x124:

            // End:0x245 [Loop If]
            if(QuestIdx < LocalQuestCache.Length)
            {
                Q = LocalQuestCache[QuestIdx];
                ObjectiveIdx = 0;
                J0x164:

                // End:0x237 [Loop If]
                if(ObjectiveIdx < Q.Objectives.Length)
                {
                    ObjectiveObj = LPQO_ObjectiveDNATag(Q.Objectives[ObjectiveIdx]);
                    // End:0x229
                    if(ObjectiveObj != none)
                    {
                        // End:0x229
                        if(ObjectiveObj.bIncludeInBestiary)
                        {
                            // End:0x229
                            if(int(ObjectiveObj.GetQuestStatus()) != int(4))
                            {
                                return;
                            }
                        }
                    }
                    ObjectiveIdx++;
                    // [Loop Continue]
                    goto J0x164;
                }
                QuestIdx++;
                // [Loop Continue]
                goto J0x124;
            }
            QM.QuestTuneDataContainer.SendQuestEvent('AllDNATagsFinished');
            LP = Class'Engine.UIInteraction'.static.GetLocalPlayer(0);
            // End:0x33B
            if(LP != none)
            {
                LPPC = LPPlayerController(LP.Actor);
                // End:0x33B
                if(LPPC != none)
                {
                    LPPC.GetAchievementManager().SetAchievementValue('Geneticist', 17);
                }
            }
        }
    }
    //return;    
}

defaultproperties
{
    bIncludeInBestiary=true
    Prerequisite=none
    PlayerVisibilityType=EQuestObjectiveVisibilityType.EQOVT_QuestUnlockedAndPrereqsSatisfied
    ProgressTrackingType=EQuestObjectiveProgressTrackingType.EQOPT_QuestUnlockedAndPrereqsSatisfied
}