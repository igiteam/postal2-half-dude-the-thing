class LPGFxJobLogMissionsView extends GFxObject within GFxMoviePlayer;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL JobLogMP;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int MyTabIndex;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MainMissionList;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL OptionalMissionList;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array MainMissionItems;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array OptionalMissionItems;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bMainMissionListInitialized;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bOptionalMissionListInitialized;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bNewContent;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bViewed;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bMissionChanged;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TrackedQuest;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int TrackedQuestListIndex;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int TrackedQuestListItemIndex;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int InitialListIndex;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int InitialListSelectedIndex;

function Init()
{
    local /*0x97E50000-0x00000000*/ private @NULL JLMP[8388609];
    local /*0x97E50000-0x00000000*/ private int TabIndex[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL LPPC;

    LPPC = LPPlayerController(Outer.GetPC());
    MyTabIndex = TabIndex;
    JobLogMP = JLMP;
    bNewContent = false;
    InitialListIndex = LPPC.JobLogInfo.MissionsRecord.ListIndex;
    // End:0xCC
    if(InitialListIndex < 0)
    {
        InitialListIndex = 0;
    }
    InitialListSelectedIndex = LPPC.JobLogInfo.MissionsRecord.ListSelectedIndex;
    // End:0x134
    if(InitialListSelectedIndex < 0)
    {
        InitialListSelectedIndex = 0;
    }
    bMainMissionListInitialized = false;
    bOptionalMissionListInitialized = false;
    JLMP.SetTabNewContentIndicator(MyTabIndex, bNewContent);
    JLMP.SetSetMissionsButtonLegendDelegate(SetMissionsButtonLegend);
    //return;    
}

function Cleanup()
{
    local /*0x97E50000-0x00000000*/ private @NULL JLMP[8388609];

    JLMP.SetSetMissionsButtonLegendDelegate(None);
    //return;    
}

function SaveState()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPPC;

    LPPC = LPPlayerController(Outer.GetPC());
    LPPC.JobLogInfo.MissionsRecord.ListIndex = int(GetCurrentListIndex());
    LPPC.JobLogInfo.MissionsRecord.ListSelectedIndex = int(GetCurrentListSelectedIndex());
    //return;    
}

function GetCurrentListIndex()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return ActionScriptFloat("GetCurrentListIndex");
    //return ReturnValue;    
}

function GetCurrentListSelectedIndex()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return ActionScriptFloat("GetCurrentListSelectedIndex");
    //return ReturnValue;    
}

function SetMissionListDataProvider()
{
    local /*0x97E50000-0x00000000*/ private bool bOptionalMissions[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL DataProvider, GameDataStore, QM, Q, Obj, LPQC;

    local /*0x97E50000-0x00000000*/ private int QuestIdx, JobCount;
    local /*0x97E50000-0x00000000*/ private byte Status;
    local /*0x97E50000-0x00000000*/ private @NULL TempQuestObj;
    local /*0x97E50000-0x00000000*/ private editfixedsize array JobLogQuests, JobLogQuestChainNames;
    local /*0x97E50000-0x00000000*/ private @NULL LP, BObj, FObj;
    local /*0x97E50000-0x00000000*/ private editfixedsize string RewardString, RewardTypeString;
    local /*0x97E50000-0x00000000*/ private int RewardVal;
    local /*0x97E50000-0x00000000*/ private editfixedsize string ProgressTextString;
    local /*0x97E50000-0x00000000*/ private @NULL LPBM;
    local /*0x97E50000-0x00000000*/ private bool bTracked, bNewItem;
    local /*0x97E50000-0x00000000*/ private @NULL DDQ;
    local /*0x97E50000-0x00000000*/ private int ObjProgress, ObjTotal;

    // End:0x1C
    if(bOptionalMissions)
    {
        OptionalMissionItems.Length = 0;        
    }
    else
    {
        MainMissionItems.Length = 0;
    }
    DataProvider = Outer.CreateArray();
    LP = Outer.GetLP();
    JobCount = 0;
    LPBM = Class'LPBreadcrumbManager'.static.GetBreadcrumbManager();
    GameDataStore = SPDataStorePersistentGameData(Class'Engine.UIRoot'.static.StaticResolveDataStore(Class'SPEngine.SPDataStorePersistentGameData'.default.Tag));
    // End:0xBDF
    if(GameDataStore.QuestManager != none)
    {
        QM = GameDataStore.QuestManager;
        LPQC = LPQuestTuneDataContainer(QM.QuestTuneDataContainer);
        // End:0xBDF
        if(LPQC != none)
        {
            LPQC.GetAllJobLogQuestChainNames(JobLogQuestChainNames);
            LPQC.GetAllQuestsInChainList(JobLogQuestChainNames, JobLogQuests);
            QuestIdx = 0;
            J0x1EF:

            // End:0xBDF [Loop If]
            if(QuestIdx < JobLogQuests.Length)
            {
                Q = LPQO_Quest(JobLogQuests[QuestIdx]);
                // End:0x25E
                if(Q.bOptionalQuest != bOptionalMissions)
                {                    
                }
                else
                {
                    Status = Q.GetQuestStatus();
                    // End:0x29E
                    if(int(Status) != int(3))
                    {                        
                    }
                    else
                    {
                        TempQuestObj = Outer.CreateObject("Object");
                        TempQuestObj.SetString("label", Q.Description, LP.GetTranslationContext());
                        TempQuestObj.SetString("Description", Q.LongDescription, LP.GetTranslationContext());
                        DDQ = LPQDD_Quest(Q.DynamicData);
                        // End:0x409
                        if(DDQ != none)
                        {
                            bNewItem = !DDQ.bItemViewedInJobLog;
                        }
                        // End:0x422
                        if(bNewItem)
                        {
                            bNewContent = true;
                        }
                        TempQuestObj.SetBool("bNewItem", bNewItem);
                        TempQuestObj.SetString("CurrentObjectiveName", "", LP.GetTranslationContext());
                        TempQuestObj.SetString("CurrentObjectiveDescription", "", LP.GetTranslationContext());
                        Obj = GetCurrentObjectiveForQuest(Q);
                        // End:0xA30
                        if(Obj != none)
                        {
                            TempQuestObj.SetString("CurrentObjectiveName", Obj.Description, LP.GetTranslationContext());
                            TempQuestObj.SetString("CurrentObjectiveDescription", Obj.LongDescription, LP.GetTranslationContext());
                            RewardString = "";
                            RewardTypeString = "";
                            ProgressTextString = "";
                            bTracked = false;
                            BObj = LPQO_ObjectiveBool(Obj);
                            // End:0x776
                            if(BObj != none)
                            {
                                RewardVal = int(BObj.RewardAmount);
                                RewardString = "" $ string(RewardVal);
                                // End:0x6FC
                                if(int(BObj.RewardType) == int(0))
                                {
                                    RewardTypeString = "tenergy";                                    
                                }
                                else
                                {
                                    // End:0x73B
                                    if(int(BObj.RewardType) == int(1))
                                    {
                                        RewardTypeString = "salvage";                                        
                                    }
                                    else
                                    {
                                        // End:0x773
                                        if(int(BObj.RewardType) == int(2))
                                        {
                                            RewardTypeString = "dna";
                                        }
                                    }
                                }                                
                            }
                            else
                            {
                                FObj = LPQO_ObjectiveFloat(Obj);
                                // End:0x999
                                if(FObj != none)
                                {
                                    RewardVal = int(FObj.RewardAmount);
                                    RewardString = "" $ string(RewardVal);
                                    // End:0x823
                                    if(int(FObj.RewardType) == int(0))
                                    {
                                        RewardTypeString = "tenergy";                                        
                                    }
                                    else
                                    {
                                        // End:0x862
                                        if(int(FObj.RewardType) == int(1))
                                        {
                                            RewardTypeString = "salvage";                                            
                                        }
                                        else
                                        {
                                            // End:0x89A
                                            if(int(FObj.RewardType) == int(2))
                                            {
                                                RewardTypeString = "dna";
                                            }
                                        }
                                    }
                                    // End:0x999
                                    if(FObj.ProgressText != none)
                                    {
                                        ObjProgress = int(FObj.DynamicData_Float.CurrentValue);
                                        ObjTotal = int(FObj.RequiredValue.GetValue());
                                        ProgressTextString = ((FObj.ProgressText.LocalizedTextMarkUp @ string(ObjProgress)) $ "/") $ string(ObjTotal);
                                    }
                                }
                            }
                            TempQuestObj.SetString("Reward", RewardString);
                            TempQuestObj.SetString("RewardType", RewardTypeString);
                            TempQuestObj.SetString("Status", ProgressTextString);
                        }
                        // End:0xAAA
                        if(Obj == LPBM.GetObjectiveToTrack())
                        {
                            TrackedQuest = Q;
                            TrackedQuestListIndex = ((bOptionalMissions) ? 1 : 0);
                            TrackedQuestListItemIndex = JobCount;
                            bTracked = true;
                        }
                        TempQuestObj.SetBool("bTracked", bTracked);
                        TempQuestObj.SetFloat("ContractIndex", float(JobCount));
                        // End:0xB6D
                        if(bOptionalMissions)
                        {
                            DataProvider.SetElementObject(JobCount, TempQuestObj);
                            OptionalMissionItems.AddItem(Q);                                                        
                        }
                        else
                        {
                            // End:0xBC6
                            if(JobCount == 0)
                            {
                                DataProvider.SetElementObject(JobCount, TempQuestObj);
                                MainMissionItems.AddItem(Q);                                                                
                            }
                        }
                        JobCount++;
                    }
                }
                QuestIdx++;
                // [Loop Continue]
                goto J0x1EF;
            }
        }
    }
    // End:0xC0E
    if(bOptionalMissions)
    {
        bOptionalMissionListInitialized = true;
        ASSetOptionalListDataProvider(DataProvider);        
    }
    else
    {
        bMainMissionListInitialized = true;
        ASSetMainListDataProvider(DataProvider);
    }
    // End:0xFBD
    if(bMainMissionListInitialized && bOptionalMissionListInitialized)
    {
        SetInitialListSelection();
        MainMissionList.RemoveAllEventListeners("CLIK_itemPress");
        MainMissionList.RemoveAllEventListeners("itemPress");
        MainMissionList.RemoveAllEventListeners("CLIK_change");
        MainMissionList.RemoveAllEventListeners("change");
        MainMissionList.RemoveAllEventListeners("CLIK_focusIn");
        MainMissionList.RemoveAllEventListeners("focusIn");
        MainMissionList.AddEventListener('CLIK_itemPress', OnMainMissionListItemPress);
        MainMissionList.AddEventListener('CLIK_change', OnMainMissionListChange);
        MainMissionList.AddEventListener('CLIK_focusIn', OnMainMissionListFocusIn);
        OptionalMissionList.RemoveAllEventListeners("CLIK_itemPress");
        OptionalMissionList.RemoveAllEventListeners("itemPress");
        OptionalMissionList.RemoveAllEventListeners("CLIK_change");
        OptionalMissionList.RemoveAllEventListeners("change");
        OptionalMissionList.RemoveAllEventListeners("CLIK_focusIn");
        OptionalMissionList.RemoveAllEventListeners("focusIn");
        OptionalMissionList.AddEventListener('CLIK_itemPress', OnOptionalMissionListItemPress);
        OptionalMissionList.AddEventListener('CLIK_change', OnOptionalMissionListChange);
        OptionalMissionList.AddEventListener('CLIK_focusIn', OnOptionalMissionListFocusIn);
    }
    //return;    
}

function GetCurrentObjectiveForQuest()
{
    local /*0x97E50000-0x00000000*/ private @NULL InQuest[8388609], ReturnValue;
    local /*0x97E50000-0x00000000*/ private int ObjectiveIdx;
    local /*0x97E50000-0x00000000*/ private byte Status;
    local /*0x97E50000-0x00000000*/ private @NULL ReturnObj, Obj;

    ObjectiveIdx = 0;
    J0x0B:

    // End:0xDD [Loop If]
    if(ObjectiveIdx < InQuest.Objectives.Length)
    {
        Obj = InQuest.Objectives[ObjectiveIdx];
        Status = Obj.GetQuestStatus();
        // End:0xAA
        if(int(Status) != int(3))
        {            
        }
        else
        {
            // End:0xBC
            if(ReturnObj != none)
            {                
            }
            else
            {
                ReturnObj = Obj;
            }
        }
        ObjectiveIdx++;
        // [Loop Continue]
        goto J0x0B;
    }
    return ReturnObj;
    //return ReturnValue;    
}

function SetInitialListSelection()
{
    local /*0x97E50000-0x00000000*/ private int ListIndex, ListSelectedIndex;

    // End:0x62
    if(((InitialListIndex == 0) && MainMissionItems.Length == 0) || (InitialListIndex == 1) && OptionalMissionItems.Length == 0)
    {
        InitialListIndex = -1;
        InitialListSelectedIndex = -1;
    }
    // End:0xB3
    if((InitialListIndex != -1) || InitialListSelectedIndex != -1)
    {
        ListIndex = InitialListIndex;
        ListSelectedIndex = InitialListSelectedIndex;        
    }
    else
    {
        // End:0xEB
        if(TrackedQuest != none)
        {
            ListIndex = TrackedQuestListIndex;
            ListSelectedIndex = TrackedQuestListItemIndex;            
        }
        else
        {
            // End:0x114
            if(MainMissionItems.Length > 0)
            {
                ListIndex = 0;
                ListSelectedIndex = 0;                
            }
            else
            {
                // End:0x13A
                if(OptionalMissionItems.Length > 0)
                {
                    ListIndex = 1;
                    ListSelectedIndex = 0;
                }
            }
        }
    }
    // End:0x154
    if(ListIndex < 0)
    {
        ListIndex = 0;
    }
    // End:0x16E
    if(ListSelectedIndex < 0)
    {
        ListSelectedIndex = 0;
    }
    ASSelectList(ListIndex);
    switch(ListIndex)
    {
        // End:0x1D4
        case 0:
            MainMissionList.SetFloat("selectedIndex", float(ListSelectedIndex));
            // End:0x217
            break;
        // End:0x214
        case 1:
            OptionalMissionList.SetFloat("selectedIndex", float(ListSelectedIndex));
            // End:0x217
            break;
        // End:0xFFFF
        default:
            break;
    }
    //return;    
}

function ASSelectList()
{
    local /*0x97E50000-0x00000000*/ private int Index[8388609];

    ActionScriptVoid("SelectList");
    //return;    
}

function ASSetMainListDataProvider()
{
    local /*0x97E50000-0x00000000*/ private @NULL Obj[8388609];

    ActionScriptVoid("SetMainListDataProvider");
    //return;    
}

function ASSetOptionalListDataProvider()
{
    local /*0x97E50000-0x00000000*/ private @NULL Obj[8388609];

    ActionScriptVoid("SetOptionalListDataProvider");
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
        // End:0x55
        case 'missionMain':
            MainMissionList = GFxClikWidget(Widget);
            SetMissionListDataProvider(false);
            // End:0x2A1
            break;
        // End:0x8B
        case 'missionOptional':
            OptionalMissionList = GFxClikWidget(Widget);
            SetMissionListDataProvider(true);
            // End:0x2A1
            break;
        // End:0x106
        case 'hdrMissionMain':
            Widget.SetText(JobLogMP.GetLocalizedString("<Strings:LostPlanetGame.JobLog.MainMission>"));
            // End:0x2A1
            break;
        // End:0x185
        case 'hdrOverview':
            Widget.SetText(JobLogMP.GetLocalizedString("<Strings:LostPlanetGame.JobLog.MissionOverview>"));
            // End:0x2A1
            break;
        // End:0x205
        case 'hdrCurrent':
            Widget.SetText(JobLogMP.GetLocalizedString("<Strings:LostPlanetGame.JobLog.CurrentObjective>"));
            // End:0x2A1
            break;
        // End:0x28F
        case 'hdrMissionOptional':
            Widget.SetText(JobLogMP.GetLocalizedString("<Strings:LostPlanetGame.JobLog.OptionalMissions>"));
            SetInitialListSelection();
            // End:0x2A1
            break;
        // End:0xFFFF
        default:
            bWasHandled = false;
            // End:0x2A1
            break;
            break;
    }
    // End:0x2E0
    if(!bWasHandled)
    {
        bWasHandled = super.WidgetInitialized(WidgetName, WidgetPath, Widget);
    }
    return bWasHandled;
    //return ReturnValue;    
}

function OnMainMissionListItemPress()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL ev[8388609];
    local /*0x97E50000-0x00000000*/ private int ItemIndex;
    local /*0x97E50000-0x00000000*/ private @NULL Data, Quest;

    Data = MainMissionList.GetObject("dataProvider").GetElementObject(ev.Index);
    // End:0x186
    if(Data != none)
    {
        ItemIndex = int(Data.GetFloat("ContractIndex"));
        Quest = LPQO_Quest(MainMissionItems[ItemIndex]);
        // End:0x15D
        if(Quest.bAllowJobLogTracking)
        {
            TrackQuest(Quest, 0, ev.Index);
            bMainMissionListInitialized = false;
            bOptionalMissionListInitialized = false;
            SetMissionListDataProvider(true);
            SetMissionListDataProvider(false);            
        }
        else
        {
            JobLogMP.PlaySoundFromTheme('InvalidChoice');
        }
    }
    //return;    
}

function OnMainMissionListChange()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL ev[8388609];

    // End:0x35
    if((MainMissionList == none) || ev.Index < 0)
    {
        return;
    }
    SetMissionViewed(ev.Index, MainMissionList, MainMissionItems[ev.Index]);
    ASUpdateDisplay();
    //return;    
}

function OnMainMissionListFocusIn()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL ev[8388609];

    // End:0x11
    if(MainMissionList == none)
    {
        return;
    }
    SetMissionViewed(int(MainMissionList.GetFloat("selectedIndex")), MainMissionList, MainMissionItems[ev.Index]);
    ASUpdateDisplay();
    //return;    
}

function ASUpdateDisplay()
{
    ActionScriptVoid("UpdateDisplay");
    //return;    
}

function OnOptionalMissionListItemPress()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL ev[8388609];
    local /*0x97E50000-0x00000000*/ private int ItemIndex;
    local /*0x97E50000-0x00000000*/ private @NULL Data, Quest;

    Data = OptionalMissionList.GetObject("dataProvider").GetElementObject(ev.Index);
    // End:0x186
    if(Data != none)
    {
        ItemIndex = int(Data.GetFloat("ContractIndex"));
        Quest = LPQO_Quest(OptionalMissionItems[ItemIndex]);
        // End:0x15D
        if(Quest.bAllowJobLogTracking)
        {
            TrackQuest(Quest, 1, ev.Index);
            bMainMissionListInitialized = false;
            bOptionalMissionListInitialized = false;
            SetMissionListDataProvider(true);
            SetMissionListDataProvider(false);            
        }
        else
        {
            JobLogMP.PlaySoundFromTheme('InvalidChoice');
        }
    }
    //return;    
}

function OnOptionalMissionListFocusIn()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL ev[8388609];

    // End:0x11
    if(OptionalMissionList == none)
    {
        return;
    }
    SetMissionViewed(int(OptionalMissionList.GetFloat("selectedIndex")), OptionalMissionList, OptionalMissionItems[ev.Index]);
    ASUpdateDisplay();
    //return;    
}

function OnOptionalMissionListChange()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL ev[8388609];

    // End:0x35
    if((OptionalMissionList == none) || ev.Index < 0)
    {
        return;
    }
    SetMissionViewed(ev.Index, OptionalMissionList, OptionalMissionItems[ev.Index]);
    ASUpdateDisplay();
    //return;    
}

function SetMissionViewed()
{
    local /*0x97E50000-0x00000000*/ private int ItemIndex[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL List[8388609], Q, Data, Obj, DDQ;

    // End:0x11
    if(List == none)
    {
        return;
    }
    bMissionChanged = true;
    Data = List.GetObject("dataProvider");
    // End:0x1A9
    if((Data != none) && ItemIndex >= 0)
    {
        Obj = Data.GetElementObject(ItemIndex);
        // End:0x148
        if(Obj != none)
        {
            Obj.SetBool("bNewItem", false);
            Data.SetElementObject(ItemIndex, Obj);
            List.SetObject("dataProvider", Data);
        }
        DDQ = LPQDD_Quest(Q.DynamicData);
        // End:0x1A9
        if(DDQ != none)
        {
            DDQ.bItemViewedInJobLog = true;
        }
    }
    //return;    
}

function TrackQuest()
{
    local /*0x97E50000-0x00000000*/ private @NULL Quest[8388609];
    local /*0x97E50000-0x00000000*/ private int ListIndex[8388609], ListItemIndex;
    local /*0x97E50000-0x00000000*/ private @NULL LPBM, Obj;

    LPBM = Class'LPBreadcrumbManager'.static.GetBreadcrumbManager();
    // End:0x108
    if(Quest != none)
    {
        Obj = GetCurrentObjectiveForQuest(Quest);
        LPBM.SetSelectedJobLogObjective(Obj);
        JobLogMP.PlaySoundFromTheme('selectObjective');
        TrackedQuest = Quest;
        TrackedQuestListIndex = ListIndex;
        TrackedQuestListItemIndex = ListItemIndex;
        InitialListIndex = TrackedQuestListIndex;
        InitialListSelectedIndex = TrackedQuestListItemIndex;        
    }
    else
    {
        LPBM.SetSelectedJobLogObjective(none);
    }
    //return;    
}

function SetMissionsButtonLegend()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string s1, s2, s3, s4, s5, s6;

    s1 = "";
    s2 = "";
    s3 = "";
    s4 = "<Strings:LostPlanetGame.JobLog.Track>";
    s5 = "<Strings:LostPlanetGame.UI.ButtonBack>";
    s6 = "";
    JobLogMP.SetButtonLegendLabelStrings(s1, s2, s3, s4, s5, s6, self);
    JobLogMP.ASRepositionButtonPrompts();
    JobLogMP.SetTitleText(JobLogMP.GetLocalizedString("<Strings:LostPlanetGame.JobLog.Contracts>"), self);
    //return;    
}

function Viewed()
{
    bViewed = true;
    SetMissionsButtonLegend();
    //return;    
}

function Update()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];

    // End:0x42
    if(bMissionChanged)
    {
        JobLogMP.PlaySoundFromTheme('MissionsScroll');
        bMissionChanged = false;
    }
    //return;    
}

defaultproperties
{
    SubWidgetBindings=/* Array type was not detected. */
}