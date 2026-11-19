class LPGFxJobLogCollectiblesView extends GFxObject within GFxMoviePlayer
    config(UI);

struct WhiteLeechObjectiveInfoStruct
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string HintString;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string FoundString;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string FoundObjectiveNameID;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL FoundObjective[536870913];
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private int CollectibleIndex[536870913];

    structdefaultproperties
    {
        HintString=""
        FoundString=""
        FoundObjectiveNameID=""
        FoundObjective=none
        CollectibleIndex=0
    }
};

struct WhiteLeechInfoStruct
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string QuestChainName;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string WhiteLeechViewEnabledQuest;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string DetailIconPath;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array Objectives;

    structdefaultproperties
    {
        QuestChainName=""
        WhiteLeechViewEnabledQuest=""
        DetailIconPath=""
        Objectives=none
    }
};

struct MessageInfoStruct
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MailMessageObj;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private int CollectibleIndex[536870913];

    structdefaultproperties
    {
        MailMessageObj=none
        CollectibleIndex=0
    }
};

struct DNATagInfoStruct
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL DNATagObj;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private int CollectibleIndex[536870913];

    structdefaultproperties
    {
        DNATagObj=none
        CollectibleIndex=0
    }
};

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL InfoLabel;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string AudioLogProgString;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string TextLogProgString;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string AkridDNAProgString;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string WhiteLeechProgString;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL AudioLogsHeader;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TextLogsHeader;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL AkridDNAHeader;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL WhiteLeechHeader;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bWhiteLeechViewEnabled[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bBestiaryViewEnabled[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bViewed;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bNewContent;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bAudioPlay;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bCollectibleChanged;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize @NULL WhiteLeechInfo[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string WhiteLeechIconName[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array AudioLogMessages;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array TextLogMessages;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string TextLogIconName[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string AudioLogIconName[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string VideoLogIconName[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array SurveyMaps;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string SurveyMapIconName[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array DNATags;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string AkridDNAIconName[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string BestiaryViewEnabledQuest[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL JobLogMP;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int MyTabIndex;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int InitialAccordionIndex;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int InitialItemIndex;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int AccordionTabsViewed[4];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int LOGS_SLOT;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int TEXTLOGS_SLOT;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int AKRIDDNA_SLOT;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int LEECH_SLOT;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float AutoScrollTimePerLine[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float AutoScrollTimeBeforeInitialScrollPerLineMultiplier[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float AutoScrollTimeBeforeScrollResetPerLineMultiplier[1073741825];

function Init()
{
    local /*0x97E50000-0x00000000*/ private @NULL JLMP[8388609];
    local /*0x97E50000-0x00000000*/ private int TabIndex[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL LPPC;

    LOGS_SLOT = 0;
    TEXTLOGS_SLOT = 1;
    AKRIDDNA_SLOT = 2;
    LEECH_SLOT = 3;
    LPPC = LPPlayerController(Outer.GetPC());
    MyTabIndex = TabIndex;
    JobLogMP = JLMP;
    bNewContent = false;
    InitialAccordionIndex = LPPC.JobLogInfo.CollectiblesRecord.ListIndex;
    // End:0xFA
    if(InitialAccordionIndex < 0)
    {
        InitialAccordionIndex = 0;
    }
    InitialItemIndex = LPPC.JobLogInfo.CollectiblesRecord.ListSelectedIndex;
    // End:0x162
    if(InitialItemIndex < 0)
    {
        InitialItemIndex = 0;
    }
    SetAutoScrollTime(AutoScrollTimePerLine, AutoScrollTimeBeforeInitialScrollPerLineMultiplier, AutoScrollTimeBeforeScrollResetPerLineMultiplier);
    InitCollectibles();
    SetInitialSelection(InitialAccordionIndex, InitialItemIndex);
    JLMP.SetTabNewContentIndicator(MyTabIndex, bNewContent);
    JLMP.SetSetCurrentCollectibleDelegate(SetCurrentCollectible);
    JLMP.SetActivateCurrentCollectibleDelegate(ActivateCurrentCollectible);
    JLMP.SetSetCollectiblesButtonLegendDelegate(SetCollectiblesButtonLegend);
    //return;    
}

function Cleanup()
{
    local /*0x97E50000-0x00000000*/ private @NULL JLMP[8388609];

    JLMP.SetSetCurrentCollectibleDelegate(None);
    JLMP.SetActivateCurrentCollectibleDelegate(None);
    JLMP.SetSetCollectiblesButtonLegendDelegate(None);
    //return;    
}

function SetInitialSelection()
{
    local /*0x97E50000-0x00000000*/ private int accordionIndex[8388609], ItemIndex;

    SetInitialHeaderSelection(accordionIndex);
    SetInitialCollectibleSelection(ItemIndex);
    //return;    
}

function SetInitialHeaderSelection()
{
    local /*0x97E50000-0x00000000*/ private int Index[8388609];

    ActionScriptVoid("SetInitialHeaderSelection");
    //return;    
}

function SetInitialCollectibleSelection()
{
    local /*0x97E50000-0x00000000*/ private int Index[8388609];

    ActionScriptVoid("SetInitialCollectibleSelection");
    //return;    
}

function SaveState()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPPC;

    LPPC = LPPlayerController(Outer.GetPC());
    LPPC.JobLogInfo.CollectiblesRecord.ListIndex = int(GetCurrentViewIndex());
    LPPC.JobLogInfo.CollectiblesRecord.ListSelectedIndex = int(GetCurrentCollectibleIndex());
    //return;    
}

function GetCurrentViewIndex()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return GetFloat("selectedButtonIndex");
    //return ReturnValue;    
}

function GetCurrentCollectibleIndex()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return ActionScriptFloat("GetCurrentCollectibleIndex");
    //return ReturnValue;    
}

function SetAutoScrollTime()
{
    local /*0x97E50000-0x00000000*/ private float timePerLine[8388609], timeBeforeInitialScrollMultiplier, timeBeforeScrollResetMultiplier;

    ActionScriptVoid("SetAutoScrollTime");
    //return;    
}

function InitCollectibles()
{
    InitCollectiblesFromWhiteLeechInfo(LEECH_SLOT, WhiteLeechInfo);
    InitCollectiblesFromAkridDNA(AKRIDDNA_SLOT);
    InitCollectiblesFromLogs(LOGS_SLOT, 1);
    InitCollectiblesFromLogs(TEXTLOGS_SLOT, 0);
    //return;    
}

function SetCurrentCollectible()
{
    local /*0x97E50000-0x00000000*/ private int CollectibleSlotNum[8388609], CollectibleIndex;

    bCollectibleChanged = true;
    switch(CollectibleSlotNum)
    {
        // End:0x4A
        case AKRIDDNA_SLOT:
            SetAkridDNAItemViewed(CollectibleSlotNum, CollectibleIndex);
            // End:0xCE
            break;
        // End:0x75
        case LEECH_SLOT:
            SetWhiteLeechItemViewed(CollectibleSlotNum, CollectibleIndex);
            // End:0xCE
            break;
        // End:0xA0
        case LOGS_SLOT:
            SetAudioLogItemViewed(CollectibleSlotNum, CollectibleIndex);
            // End:0xCE
            break;
        // End:0xCB
        case TEXTLOGS_SLOT:
            SetTextLogItemViewed(CollectibleSlotNum, CollectibleIndex);
            // End:0xCE
            break;
        // End:0xFFFF
        default:
            break;
    }
    //return;    
}

function ActivateCurrentCollectible()
{
    local /*0x97E50000-0x00000000*/ private int CollectibleSlotNum[8388609], CollectibleIndex;

    switch(CollectibleSlotNum)
    {
        // End:0x22
        case AKRIDDNA_SLOT:
            // End:0x66
            break;
        // End:0x31
        case LEECH_SLOT:
            // End:0x66
            break;
        // End:0x54
        case LOGS_SLOT:
            ActivateLog(CollectibleIndex, 1);
            // End:0x66
            break;
        // End:0x63
        case TEXTLOGS_SLOT:
            // End:0x66
            break;
        // End:0xFFFF
        default:
            break;
    }
    //return;    
}

function SetWhiteLeechItemViewed()
{
    local /*0x97E50000-0x00000000*/ private int viewIndex[8388609], ItemIndex, I;
    local /*0x97E50000-0x00000000*/ private @NULL DDBool, DDFloat, Obj;

    // End:0x2C
    if(!bViewed || AccordionTabsViewed[viewIndex] == 0)
    {
        return;
    }
    I = 0;
    J0x37:

    // End:0x1C2 [Loop If]
    if(I < WhiteLeechInfo.Objectives.Length)
    {
        // End:0x1B4
        if(WhiteLeechInfo.Objectives[I].CollectibleIndex == ItemIndex)
        {
            Obj = WhiteLeechInfo.Objectives[I].FoundObjective;
            DDBool = LPQDD_Bool(Obj.DynamicData);
            DDFloat = LPQDD_Float(Obj.DynamicData);
            // End:0x181
            if(DDBool != none)
            {
                DDBool.bItemViewedInJobLog = true;                
            }
            else
            {
                // End:0x1B1
                if(DDFloat != none)
                {
                    DDFloat.bItemViewedInJobLog = true;
                }
            }
            // [Explicit Break]
            goto J0x1C2;
        }
        I++;
        // [Loop Continue]
        goto J0x37;
    }
    J0x1C2:

    //return;    
}

function InitCollectiblesFromWhiteLeechInfo()
{
    local /*0x97E50000-0x00000000*/ private int CollectibleSlotNum[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL InWhiteLeechInfo[25165825];
    local /*0x97E50000-0x00000000*/ private int I;
    local /*0x97E50000-0x00000000*/ private @NULL GameDataStore, QM;
    local /*0x97E50000-0x00000000*/ private editfixedsize array LeechQuests;
    local /*0x97E50000-0x00000000*/ private @NULL Q, Objective;
    local /*0x97E50000-0x00000000*/ private int QuestIdx, ObjectiveIdx, FoundCount, totalCount;
    local /*0x97E50000-0x00000000*/ private @NULL DDBool, DDFloat;
    local /*0x97E50000-0x00000000*/ private bool bComplete, bPartialComplete, bLocked, bNewItem;
    local /*0x97E50000-0x00000000*/ private editfixedsize string DetailHUDIconName, ItemName, ItemDescription, IconName;
    local /*0x97E50000-0x00000000*/ private bool bFoundObjective;
    local /*0x97E50000-0x00000000*/ private byte Status;

    FoundCount = 0;
    totalCount = 0;
    GameDataStore = SPDataStorePersistentGameData(Class'Engine.UIRoot'.static.StaticResolveDataStore(Class'SPEngine.SPDataStorePersistentGameData'.default.Tag));
    // End:0x820
    if(GameDataStore.QuestManager != none)
    {
        QM = GameDataStore.QuestManager;
        QM.QuestTuneDataContainer.GetAllQuestsInChain(name(InWhiteLeechInfo.QuestChainName), LeechQuests);
        QuestIdx = 0;
        J0x119:

        // End:0x1F6 [Loop If]
        if(QuestIdx < LeechQuests.Length)
        {
            // End:0x1E8
            if(LeechQuests[QuestIdx].NameID == name(InWhiteLeechInfo.WhiteLeechViewEnabledQuest))
            {
                Status = LeechQuests[QuestIdx].GetQuestStatus();
                // End:0x1E5
                if((int(Status) == int(4)) || int(Status) == int(3))
                {
                    bWhiteLeechViewEnabled = true;
                }
                // [Explicit Break]
                goto J0x1F6;
            }
            QuestIdx++;
            // [Loop Continue]
            goto J0x119;
        }
        J0x1F6:

        // End:0x216
        if(!bWhiteLeechViewEnabled)
        {
            LEECH_SLOT = -1;
            return;
        }
        DetailHUDIconName = JobLogMP.GetUILoaderPathForTextureFromPathName(InWhiteLeechInfo.DetailIconPath);
        I = 0;
        J0x266:

        // End:0x820 [Loop If]
        if(I < InWhiteLeechInfo.Objectives.Length)
        {
            bFoundObjective = false;
            bNewItem = false;
            bComplete = false;
            QuestIdx = 0;
            J0x2C0:

            // End:0x548 [Loop If]
            if(QuestIdx < LeechQuests.Length)
            {
                Q = LeechQuests[QuestIdx];
                ObjectiveIdx = 0;
                J0x300:

                // End:0x52A [Loop If]
                if(ObjectiveIdx < Q.Objectives.Length)
                {
                    Objective = Q.Objectives[ObjectiveIdx];
                    // End:0x51C
                    if(name(InWhiteLeechInfo.Objectives[I].FoundObjectiveNameID) == Objective.NameID)
                    {
                        DDBool = LPQDD_Bool(Objective.DynamicData);
                        DDFloat = LPQDD_Float(Objective.DynamicData);
                        InWhiteLeechInfo.Objectives[I].FoundObjective = Objective;
                        // End:0x4A0
                        if(DDBool != none)
                        {
                            bNewItem = !DDBool.bItemViewedInJobLog;                            
                        }
                        else
                        {
                            // End:0x4DB
                            if(DDFloat != none)
                            {
                                bNewItem = !DDFloat.bItemViewedInJobLog;
                            }
                        }
                        bComplete = int(Objective.GetQuestStatus()) == int(4);
                        bFoundObjective = true;
                        // [Explicit Break]
                        goto J0x52A;
                    }
                    ObjectiveIdx++;
                    // [Loop Continue]
                    goto J0x300;
                }
                J0x52A:

                // End:0x53A
                if(bFoundObjective)
                {
                    // [Explicit Break]
                    goto J0x548;
                }
                QuestIdx++;
                // [Loop Continue]
                goto J0x2C0;
            }
            J0x548:

            // End:0x812
            if(bFoundObjective)
            {
                ItemName = InWhiteLeechInfo.Objectives[I].FoundObjective.Description;
                // End:0x6C7
                if(bComplete)
                {
                    FoundCount++;
                    bPartialComplete = false;
                    bLocked = false;
                    ItemName = JobLogMP.GetLocalizedString("<Strings:LostPlanetGame.LeechCollectibles.FoundPrefixString>") @ ItemName;
                    ItemDescription = JobLogMP.GetLocalizedString(InWhiteLeechInfo.Objectives[I].FoundString);
                    IconName = DetailHUDIconName;                    
                }
                else
                {
                    bPartialComplete = true;
                    bLocked = false;
                    ItemDescription = JobLogMP.GetLocalizedString(InWhiteLeechInfo.Objectives[I].HintString);
                    IconName = "";
                }
                // End:0x766
                if(bNewItem)
                {
                    bNewContent = true;
                }
                InWhiteLeechInfo.Objectives[I].CollectibleIndex = totalCount;
                InitCollectible(CollectibleSlotNum, totalCount, ItemName, WhiteLeechIconName, bLocked, bPartialComplete, bNewItem, IconName, ItemDescription);
                totalCount++;
            }
            I++;
            // [Loop Continue]
            goto J0x266;
        }
    }
    WhiteLeechProgString = (string(FoundCount) $ "/") $ string(totalCount);
    SetWhiteLeechProgressString();
    //return;    
}

function SetAkridDNAItemViewed()
{
    local /*0x97E50000-0x00000000*/ private int viewIndex[8388609], ItemIndex, I;
    local /*0x97E50000-0x00000000*/ private @NULL DDBool, DDFloat;

    // End:0x2C
    if(!bViewed || AccordionTabsViewed[viewIndex] == 0)
    {
        return;
    }
    I = 0;
    J0x37:

    // End:0x193 [Loop If]
    if(I < DNATags.Length)
    {
        // End:0x185
        if(DNATags[I].CollectibleIndex == ItemIndex)
        {
            DDBool = LPQDD_Bool(DNATags[I].DNATagObj.DynamicData);
            DDFloat = LPQDD_Float(DNATags[I].DNATagObj.DynamicData);
            // End:0x152
            if(DDBool != none)
            {
                DDBool.bItemViewedInJobLog = true;                
            }
            else
            {
                // End:0x182
                if(DDFloat != none)
                {
                    DDFloat.bItemViewedInJobLog = true;
                }
            }
            // [Explicit Break]
            goto J0x193;
        }
        I++;
        // [Loop Continue]
        goto J0x37;
    }
    J0x193:

    //return;    
}

function InitCollectiblesFromAkridDNA()
{
    local /*0x97E50000-0x00000000*/ private int CollectibleSlotNum[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL GameDataStore, QM, Q;
    local /*0x97E50000-0x00000000*/ private editfixedsize array LocalQuestCache;
    local /*0x97E50000-0x00000000*/ private int QuestIdx, ObjectiveIdx, FoundCount, totalCount;
    local /*0x97E50000-0x00000000*/ private @NULL ObjectiveObj;
    local /*0x97E50000-0x00000000*/ private bool bLocked, bNewItem;
    local /*0x97E50000-0x00000000*/ private editfixedsize string DetailHUDIconName, ItemName, ItemDescription;
    local /*0x97E50000-0x00000000*/ private @NULL DNAInfo, DDBool, DDFloat;
    local /*0x97E50000-0x00000000*/ private byte Status;
    local /*0x97E50000-0x00000000*/ private bool bBestiaryObjectiveFound;

    DNATags.Length = 0;
    FoundCount = 0;
    totalCount = 0;
    GameDataStore = SPDataStorePersistentGameData(Class'Engine.UIRoot'.static.StaticResolveDataStore(Class'SPEngine.SPDataStorePersistentGameData'.default.Tag));
    // End:0x603
    if(GameDataStore.QuestManager != none)
    {
        QM = GameDataStore.QuestManager;
        QM.QuestTuneDataContainer.GetAllQuests(LocalQuestCache);
        QuestIdx = 0;
        J0x107:

        // End:0x1DD [Loop If]
        if(QuestIdx < LocalQuestCache.Length)
        {
            // End:0x1CF
            if(LocalQuestCache[QuestIdx].NameID == name(BestiaryViewEnabledQuest))
            {
                bBestiaryObjectiveFound = true;
                Status = LocalQuestCache[QuestIdx].GetQuestStatus();
                // End:0x1CC
                if((int(Status) == int(4)) || int(Status) == int(3))
                {
                    bBestiaryViewEnabled = true;
                }
                // [Explicit Break]
                goto J0x1DD;
            }
            QuestIdx++;
            // [Loop Continue]
            goto J0x107;
        }
        J0x1DD:

        // End:0x1EC
        if(!bBestiaryObjectiveFound)
        {
        }
        // End:0x20C
        if(!bBestiaryViewEnabled)
        {
            AKRIDDNA_SLOT = -1;
            return;
        }
        LocalQuestCache.Length = 0;
        QM.QuestTuneDataContainer.GetAllQuestsInChain('DNATagging', LocalQuestCache);
        QuestIdx = 0;
        J0x269:

        // End:0x603 [Loop If]
        if(QuestIdx < LocalQuestCache.Length)
        {
            Q = LocalQuestCache[QuestIdx];
            ObjectiveIdx = 0;
            J0x2A9:

            // End:0x5F5 [Loop If]
            if(ObjectiveIdx < Q.Objectives.Length)
            {
                ObjectiveObj = LPQO_ObjectiveDNATag(Q.Objectives[ObjectiveIdx]);
                // End:0x5E7
                if(ObjectiveObj != none)
                {
                    DNAInfo.DNATagObj = ObjectiveObj;
                    DNAInfo.CollectibleIndex = totalCount;
                    DNATags.AddItem(DNAInfo);                    
                    // End:0x3BB
                    if(int(ObjectiveObj.GetQuestStatus()) == int(4))
                    {
                        bLocked = false;                        
                    }
                    else
                    {
                        bLocked = true;
                    }
                    bNewItem = false;
                    // End:0x4BD
                    if(!bLocked)
                    {
                        DDBool = LPQDD_Bool(ObjectiveObj.DynamicData);
                        DDFloat = LPQDD_Float(ObjectiveObj.DynamicData);
                        // End:0x482
                        if(DDBool != none)
                        {
                            bNewItem = !DDBool.bItemViewedInJobLog;                            
                        }
                        else
                        {
                            // End:0x4BD
                            if(DDFloat != none)
                            {
                                bNewItem = !DDFloat.bItemViewedInJobLog;
                            }
                        }
                    }
                    // End:0x4D6
                    if(bNewItem)
                    {
                        bNewContent = true;
                    }
                    ItemName = ObjectiveObj.Description;
                    ItemDescription = ObjectiveObj.LongDescription;
                    DetailHUDIconName = JobLogMP.GetUILoaderPathForTextureFromPathName(ObjectiveObj.IconTextureString);
                    InitCollectible(CollectibleSlotNum, totalCount, ItemName, AkridDNAIconName, bLocked, false, bNewItem, DetailHUDIconName, ItemDescription);
                    totalCount++;
                    // End:0x5E7
                    if(!bLocked)
                    {
                        FoundCount++;
                    }
                }
                ObjectiveIdx++;
                // [Loop Continue]
                goto J0x2A9;
            }
            QuestIdx++;
            // [Loop Continue]
            goto J0x269;
        }
    }
    AkridDNAProgString = (string(FoundCount) $ "/") $ string(totalCount);
    SetAkridDNAProgressString();
    //return;    
}

function SetAudioLogItemViewed()
{
    local /*0x97E50000-0x00000000*/ private int viewIndex[8388609], ItemIndex, I;
    local /*0x97E50000-0x00000000*/ private @NULL DDObj;

    // End:0x2C
    if(!bViewed || AccordionTabsViewed[viewIndex] == 0)
    {
        return;
    }
    I = 0;
    J0x37:

    // End:0x154 [Loop If]
    if(I < AudioLogMessages.Length)
    {
        // End:0x146
        if(AudioLogMessages[I].CollectibleIndex == ItemIndex)
        {
            AudioLogMessages[I].MailMessageObj.AdjustQuestProgress(1.0000000);
            DDObj = LPQDD_MailMessage(AudioLogMessages[I].MailMessageObj.DynamicData);
            // End:0x143
            if(DDObj != none)
            {
                DDObj.bItemViewedInJobLog = true;
            }
            // [Explicit Break]
            goto J0x154;
        }
        I++;
        // [Loop Continue]
        goto J0x37;
    }
    J0x154:

    //return;    
}

function SetTextLogItemViewed()
{
    local /*0x97E50000-0x00000000*/ private int viewIndex[8388609], ItemIndex, I;
    local /*0x97E50000-0x00000000*/ private @NULL DDObj;

    // End:0x2C
    if(!bViewed || AccordionTabsViewed[viewIndex] == 0)
    {
        return;
    }
    I = 0;
    J0x37:

    // End:0x154 [Loop If]
    if(I < TextLogMessages.Length)
    {
        // End:0x146
        if(TextLogMessages[I].CollectibleIndex == ItemIndex)
        {
            TextLogMessages[I].MailMessageObj.AdjustQuestProgress(1.0000000);
            DDObj = LPQDD_MailMessage(TextLogMessages[I].MailMessageObj.DynamicData);
            // End:0x143
            if(DDObj != none)
            {
                DDObj.bItemViewedInJobLog = true;
            }
            // [Explicit Break]
            goto J0x154;
        }
        I++;
        // [Loop Continue]
        goto J0x37;
    }
    J0x154:

    //return;    
}

function InitCollectiblesFromLogs()
{
    local /*0x97E50000-0x00000000*/ private int CollectibleSlotNum[8388609], logType;
    local /*0x97E50000-0x00000000*/ private @NULL GameDataStore, QM, Q;
    local /*0x97E50000-0x00000000*/ private editfixedsize array LocalQuestCache;
    local /*0x97E50000-0x00000000*/ private int QuestIdx, ObjectiveIdx, FoundCount, totalCount;
    local /*0x97E50000-0x00000000*/ private @NULL ObjectiveObj, DDObj;
    local /*0x97E50000-0x00000000*/ private bool bLocked;
    local /*0x97E50000-0x00000000*/ private @NULL MessageData;
    local /*0x97E50000-0x00000000*/ private editfixedsize string HUDIconName;
    local /*0x97E50000-0x00000000*/ private bool bNewItem;
    local /*0x97E50000-0x00000000*/ private editfixedsize string dateString, timeString, yearString, yearPrefixString;
    local /*0x97E50000-0x00000000*/ private @NULL LPPC, MsgInfo;

    // End:0x1E
    if(logType == 0)
    {
        TextLogMessages.Length = 0;        
    }
    else
    {
        // End:0x39
        if(logType == 1)
        {
            AudioLogMessages.Length = 0;
        }
    }
    FoundCount = 0;
    totalCount = 0;
    LPPC = LPPlayerController(Outer.GetPC());
    GameDataStore = SPDataStorePersistentGameData(Class'Engine.UIRoot'.static.StaticResolveDataStore(Class'SPEngine.SPDataStorePersistentGameData'.default.Tag));
    // End:0xA66
    if(GameDataStore.QuestManager != none)
    {
        QM = GameDataStore.QuestManager;
        QM.QuestTuneDataContainer.GetAllQuestsInChain('MailMessages', LocalQuestCache);
        QuestIdx = 0;
        J0x16F:

        // End:0xA66 [Loop If]
        if(QuestIdx < LocalQuestCache.Length)
        {
            Q = LocalQuestCache[QuestIdx];
            ObjectiveIdx = 0;
            J0x1AF:

            // End:0xA58 [Loop If]
            if(ObjectiveIdx < Q.Objectives.Length)
            {
                ObjectiveObj = LPQO_ObjectiveMailMessage(Q.Objectives[ObjectiveIdx]);
                // End:0xA4A
                if(ObjectiveObj != none)
                {
                    DDObj = LPQDD_MailMessage(ObjectiveObj.DynamicData);
                    // End:0xA4A
                    if(DDObj != none)
                    {
                        // End:0x29F
                        if(int(ObjectiveObj.GetQuestStatus()) != int(1))
                        {
                            bLocked = false;                            
                        }
                        else
                        {
                            bLocked = true;
                        }
                        // End:0x2C7
                        if(bLocked)
                        {
                            bNewItem = false;                            
                        }
                        else
                        {
                            bNewItem = !DDObj.bItemViewedInJobLog;
                            // End:0x30C
                            if(bNewItem)
                            {
                                bNewContent = true;
                            }
                        }
                        MessageData = ObjectiveObj.Message;
                        yearPrefixString = ((MessageData.Year < 0) ? "<Strings:LostPlanetGame.JobLog.DatePrefix_TrialCentury>" : "<Strings:LostPlanetGame.JobLog.DatePrefix_AfterTrial>");
                        yearPrefixString = JobLogMP.GetLocalizedString(yearPrefixString);
                        yearString = (yearPrefixString $ ((MessageData.Year < 0) ? "" : " ")) $ string(MessageData.Year);
                        dateString = (((((((MessageData.Day < 10) ? "0" : "") $ string(MessageData.Day)) $ ".") $ ((MessageData.Month < 10) ? "0" : "")) $ string(MessageData.Month)) $ ".") $ yearString;
                        timeString = ((((((((MessageData.Hour < 10) ? "0" : "") $ string(MessageData.Hour)) $ ":") $ ((MessageData.Minute < 10) ? "0" : "")) $ string(MessageData.Minute)) $ ":") $ ((MessageData.Second < 10) ? "0" : "")) $ string(MessageData.Second);
                        // End:0x83A
                        if(logType == 0)
                        {
                            // End:0x837
                            if(LPMailMessageDataText(MessageData) != none)
                            {
                                HUDIconName = TextLogIconName;
                                MsgInfo.MailMessageObj = ObjectiveObj;
                                MsgInfo.CollectibleIndex = totalCount;
                                TextLogMessages.AddItem(MsgInfo);                                
                                InitMessageCollectible(CollectibleSlotNum, totalCount, ObjectiveObj.Description, HUDIconName, bLocked, false, bNewItem, "", MessageData.MessageBody, MessageData.MessageSender, MessageData.MessageSubject, dateString, timeString);
                                // End:0x812
                                if(((LPPC != none) && LPPC.JobLogAutoOpenMessage != none) && ObjectiveObj == LPPC.JobLogAutoOpenMessage)
                                {
                                    InitialAccordionIndex = CollectibleSlotNum;
                                    InitialItemIndex = totalCount;
                                }
                                totalCount++;
                                // End:0x837
                                if(!bLocked)
                                {
                                    FoundCount++;
                                }
                            }                            
                        }
                        else
                        {
                            // End:0xA4A
                            if(logType == 1)
                            {
                                // End:0xA4A
                                if(LPMailMessageDataAudio(MessageData) != none)
                                {
                                    HUDIconName = AudioLogIconName;
                                    MsgInfo.MailMessageObj = ObjectiveObj;
                                    MsgInfo.CollectibleIndex = totalCount;
                                    AudioLogMessages.AddItem(MsgInfo);                                    
                                    InitMessageCollectible(CollectibleSlotNum, totalCount, ObjectiveObj.Description, HUDIconName, bLocked, false, bNewItem, "", MessageData.MessageBody, MessageData.MessageSender, MessageData.MessageSubject, dateString, timeString);
                                    // End:0xA25
                                    if(((LPPC != none) && LPPC.JobLogAutoOpenMessage != none) && ObjectiveObj == LPPC.JobLogAutoOpenMessage)
                                    {
                                        InitialAccordionIndex = CollectibleSlotNum;
                                        InitialItemIndex = totalCount;
                                    }
                                    totalCount++;
                                    // End:0xA4A
                                    if(!bLocked)
                                    {
                                        FoundCount++;
                                    }
                                }
                            }
                        }
                    }
                }
                ObjectiveIdx++;
                // [Loop Continue]
                goto J0x1AF;
            }
            QuestIdx++;
            // [Loop Continue]
            goto J0x16F;
        }
    }
    // End:0xAA9
    if(logType == 0)
    {
        TextLogProgString = (string(FoundCount) $ "/") $ string(totalCount);
        SetTextLogProgressString();        
    }
    else
    {
        // End:0xAE9
        if(logType == 1)
        {
            AudioLogProgString = (string(FoundCount) $ "/") $ string(totalCount);
            SetAudioLogProgressString();
        }
    }
    //return;    
}

function SetAudioLogProgressString()
{
    // End:0x46
    if(AudioLogsHeader != none)
    {
        AudioLogsHeader.SetString("progressText", AudioLogProgString);
    }
    //return;    
}

function SetTextLogProgressString()
{
    // End:0x46
    if(TextLogsHeader != none)
    {
        TextLogsHeader.SetString("progressText", TextLogProgString);
    }
    //return;    
}

function SetAkridDNAProgressString()
{
    // End:0x46
    if(AkridDNAHeader != none)
    {
        AkridDNAHeader.SetString("progressText", AkridDNAProgString);
    }
    //return;    
}

function SetWhiteLeechProgressString()
{
    // End:0x46
    if(WhiteLeechHeader != none)
    {
        WhiteLeechHeader.SetString("progressText", WhiteLeechProgString);
    }
    //return;    
}

function ActivateLog()
{
    local /*0x97E50000-0x00000000*/ private int CollectibleIndex[8388609], logType;
    local /*0x97E50000-0x00000000*/ private @NULL AudioMsg;

    // End:0x12B
    if(logType == 1)
    {
        // End:0x12B
        if((CollectibleIndex >= 0) && CollectibleIndex < AudioLogMessages.Length)
        {
            AudioMsg = LPMailMessageDataAudio(AudioLogMessages[CollectibleIndex].MailMessageObj.Message);
            // End:0x12B
            if(AudioMsg != none)
            {
                // End:0x102
                if(AudioMsg.CanPlayMessage())
                {
                    Outer.PlaySoundFromTheme('PlayAudio');
                    AudioMsg.Play();                    
                }
                else
                {
                    Outer.PlaySoundFromTheme('AudioLog_Busy');
                }
            }
        }
    }
    //return;    
}

function InitCollectible()
{
    local /*0x97E50000-0x00000000*/ private int Type[8388609], Index;
    local /*0x97E50000-0x00000000*/ private editfixedsize string FriendlyName[8388609], HUDIconName;
    local /*0x97E50000-0x00000000*/ private bool bLocked[8388609], bPartialComplete, bNewItem;
    local /*0x97E50000-0x00000000*/ private editfixedsize string DetailHUDIconName[8388609], Description;

    ActionScriptVoid("InitCollectible");
    //return;    
}

function InitMessageCollectible()
{
    local /*0x97E50000-0x00000000*/ private int Type[8388609], Index;
    local /*0x97E50000-0x00000000*/ private editfixedsize string FriendlyName[8388609], HUDIconName;
    local /*0x97E50000-0x00000000*/ private bool bLocked[8388609], bPartialComplete, bNewItem;
    local /*0x97E50000-0x00000000*/ private editfixedsize string DetailHUDIconName[8388609], Description, From, Subject, Date, Time;

    ActionScriptVoid("InitMessageCollectible");
    //return;    
}

function OnAudioLogsFocusIn()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL ev[8388609];

    // End:0x4D
    if(bViewed)
    {
        AccordionTabsViewed[LOGS_SLOT] = 1;
        SetAudioLogItemViewed(LOGS_SLOT, int(GetCurrentCollectibleIndex()));
        bAudioPlay = true;
    }
    //return;    
}

function OnTextLogsFocusIn()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL ev[8388609];

    // End:0x4D
    if(bViewed)
    {
        AccordionTabsViewed[TEXTLOGS_SLOT] = 1;
        SetTextLogItemViewed(TEXTLOGS_SLOT, int(GetCurrentCollectibleIndex()));
        bAudioPlay = false;
    }
    //return;    
}

function OnAkridDNAFocusIn()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL ev[8388609];

    // End:0x4D
    if(bViewed)
    {
        AccordionTabsViewed[AKRIDDNA_SLOT] = 1;
        SetAkridDNAItemViewed(AKRIDDNA_SLOT, int(GetCurrentCollectibleIndex()));
        bAudioPlay = false;
    }
    //return;    
}

function OnWhiteLeechFocusIn()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL ev[8388609];

    // End:0x4D
    if(bViewed)
    {
        AccordionTabsViewed[LEECH_SLOT] = 1;
        SetWhiteLeechItemViewed(LEECH_SLOT, int(GetCurrentCollectibleIndex()));
        bAudioPlay = false;
    }
    //return;    
}

event WidgetInitialized()
{
    local /*0x97E50000-0x00000000*/ private name WidgetName[8388609], WidgetPath;
    local /*0x97E50000-0x00000000*/ private @NULL Widget[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], bWasHandled;

    bWasHandled = true;
    switch(WidgetName)
    {
        // End:0x63
        case 'InfoLabel':
            InfoLabel = Widget;
            InfoLabel.SetText("");
            // End:0x34F
            break;
        // End:0x86
        case 'b1':
            SetUpAudioLogsHeaderWidget(Widget, 0);
            // End:0x34F
            break;
        // End:0xA9
        case 'b2':
            SetUpTextLogsHeaderWidget(Widget, 1);
            // End:0x34F
            break;
        // End:0x132
        case 'b3':
            // End:0xFC
            if((bWhiteLeechViewEnabled && !bBestiaryViewEnabled) && WhiteLeechHeader == none)
            {
                SetUpWhiteLeechHeaderWidget(Widget, 2);                
            }
            else
            {
                // End:0x12F
                if(bBestiaryViewEnabled && AkridDNAHeader == none)
                {
                    SetUpAkridDNAHeaderWidget(Widget, 2);
                }
            }
            // End:0x34F
            break;
        // End:0x1BB
        case 'b4':
            // End:0x185
            if((bBestiaryViewEnabled && !bWhiteLeechViewEnabled) && AkridDNAHeader == none)
            {
                SetUpAkridDNAHeaderWidget(Widget, 3);                
            }
            else
            {
                // End:0x1B8
                if(bWhiteLeechViewEnabled && WhiteLeechHeader == none)
                {
                    SetUpWhiteLeechHeaderWidget(Widget, 3);
                }
            }
            // End:0x34F
            break;
        // End:0x241
        case 'From':
            Widget.GetObject("textField").SetText("<Strings:LostPlanetGame.JobLog.MessageSenderHeader>");
            // End:0x34F
            break;
        // End:0x2C8
        case 'Subject':
            Widget.GetObject("textField").SetText("<Strings:LostPlanetGame.JobLog.MessageSubjectHeader>");
            // End:0x34F
            break;
        // End:0x34C
        case 'Date':
            Widget.GetObject("textField").SetText("<Strings:LostPlanetGame.JobLog.MessageDateHeader>");
            // End:0x34F
            break;
        // End:0xFFFF
        default:
            break;
    }
    // End:0x38E
    if(!bWasHandled)
    {
        bWasHandled = super.WidgetInitialized(WidgetName, WidgetPath, Widget);
    }
    return bWasHandled;
    //return ReturnValue;    
}

function SetUpAudioLogsHeaderWidget()
{
    local /*0x97E50000-0x00000000*/ private @NULL Widget[8388609];
    local /*0x97E50000-0x00000000*/ private int TabIndex[8388609];

    LOGS_SLOT = TabIndex;
    ASRegisterHeader(TabIndex, "LogsView");
    AudioLogsHeader = Widget;
    AudioLogsHeader.SetString("label", "<Strings:LostPlanetGame.JobLog.Logs>");
    SetAudioLogProgressString();
    SetInitialSelection(InitialAccordionIndex, InitialItemIndex);
    GFxClikWidget(Widget).AddEventListener('CLIK_focusIn', OnAudioLogsFocusIn);
    AccordionTabsViewed[TabIndex] = 0;
    //return;    
}

function SetUpTextLogsHeaderWidget()
{
    local /*0x97E50000-0x00000000*/ private @NULL Widget[8388609];
    local /*0x97E50000-0x00000000*/ private int TabIndex[8388609];

    TEXTLOGS_SLOT = TabIndex;
    ASRegisterHeader(TabIndex, "SurveyMapsView");
    TextLogsHeader = Widget;
    TextLogsHeader.SetString("label", "<Strings:LostPlanetGame.JobLog.TextLogs>");
    SetTextLogProgressString();
    SetInitialSelection(InitialAccordionIndex, InitialItemIndex);
    GFxClikWidget(Widget).AddEventListener('CLIK_focusIn', OnTextLogsFocusIn);
    AccordionTabsViewed[TabIndex] = 0;
    //return;    
}

function SetUpAkridDNAHeaderWidget()
{
    local /*0x97E50000-0x00000000*/ private @NULL Widget[8388609];
    local /*0x97E50000-0x00000000*/ private int TabIndex[8388609];

    AKRIDDNA_SLOT = TabIndex;
    ASRegisterHeader(TabIndex, "AkridDNAView");
    AkridDNAHeader = Widget;
    AkridDNAHeader.SetString("label", "<Strings:LostPlanetGame.JobLog.AkridDNA>");
    SetAkridDNAProgressString();
    SetInitialSelection(InitialAccordionIndex, InitialItemIndex);
    GFxClikWidget(Widget).AddEventListener('CLIK_focusIn', OnAkridDNAFocusIn);
    AccordionTabsViewed[TabIndex] = 0;
    //return;    
}

function SetUpWhiteLeechHeaderWidget()
{
    local /*0x97E50000-0x00000000*/ private @NULL Widget[8388609];
    local /*0x97E50000-0x00000000*/ private int TabIndex[8388609];

    LEECH_SLOT = TabIndex;
    ASRegisterHeader(TabIndex, "WhiteLeechView");
    WhiteLeechHeader = Widget;
    WhiteLeechHeader.SetString("label", "<Strings:LostPlanetGame.JobLog.WhiteLeechHunt>");
    SetWhiteLeechProgressString();
    SetInitialSelection(InitialAccordionIndex, InitialItemIndex);
    GFxClikWidget(Widget).AddEventListener('CLIK_focusIn', OnWhiteLeechFocusIn);
    AccordionTabsViewed[TabIndex] = 0;
    //return;    
}

function ASRegisterHeader()
{
    local /*0x97E50000-0x00000000*/ private int Index[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize string DataViewName[8388609];

    ActionScriptVoid("RegisterHeader");
    //return;    
}

event FilterButtonInput()
{
    local /*0x97E50000-0x00000000*/ private int ControllerId[8388609];
    local /*0x97E50000-0x00000000*/ private name ButtonName[8388609];
    local /*0x97E50000-0x00000000*/ private byte InputEvent[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], Retval;

    Retval = false;
    return Retval;
    //return ReturnValue;    
}

function SetCollectiblesButtonLegend()
{
    local /*0x97E50000-0x00000000*/ private bool bInAudioPlay[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize string s1, s2, s3, s4, s5, s6;

    // End:0xBC
    if(bInAudioPlay)
    {
        s1 = "";
        s2 = "";
        s3 = "<Strings:LostPlanetGame.JobLog.Scroll>";
        s4 = "<Strings:LostPlanetGame.JobLog.Play>";
        s5 = "<Strings:LostPlanetGame.UI.ButtonBack>";        
    }
    else
    {
        s1 = "";
        s2 = "";
        s3 = "";
        s4 = "<Strings:LostPlanetGame.JobLog.Scroll>";
        s5 = "<Strings:LostPlanetGame.UI.ButtonBack>";
    }
    s6 = "";
    JobLogMP.SetButtonLegendLabelStrings(s1, s2, s3, s4, s5, s6, self);
    JobLogMP.SetTitleText(JobLogMP.GetLocalizedString("<Strings:LostPlanetGame.JobLog.Collectibles>"), self);
    JobLogMP.ASRepositionButtonPrompts();
    //return;    
}

function Viewed()
{
    local /*0x97E50000-0x00000000*/ private int currentViewIndex;

    bViewed = true;
    currentViewIndex = int(GetCurrentViewIndex());
    AccordionTabsViewed[currentViewIndex] = 1;
    SetCurrentCollectible(currentViewIndex, int(GetCurrentCollectibleIndex()));
    SetCollectiblesButtonLegend(bAudioPlay);
    //return;    
}

function Update()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];

    // End:0x42
    if(bCollectibleChanged)
    {
        JobLogMP.PlaySoundFromTheme('InventoryCollectibleScroll');
        bCollectibleChanged = false;
    }
    //return;    
}

defaultproperties
{
    WhiteLeechInfo=(QuestChainName="Act2_Ethologist",WhiteLeechViewEnabledQuest="2_E1",DetailIconPath="ShopItemIcons.icon_AlbinoTarkaa",Objectives=/* Array type was not detected. */)
    WhiteLeechIconName="iconWhiteLeech"
    TextLogIconName="iconLogText"
    AudioLogIconName="iconLogAudio"
    VideoLogIconName="iconLogVideo"
    SurveyMapIconName="iconSurveyMap"
    AkridDNAIconName="iconAkridDNA"
    BestiaryViewEnabledQuest="1_R1_OPT"
    AutoScrollTimePerLine=60.0000000
    AutoScrollTimeBeforeInitialScrollPerLineMultiplier=0.4000000
    AutoScrollTimeBeforeScrollResetPerLineMultiplier=0.4000000
    SubWidgetBindings=/* Array type was not detected. */
}