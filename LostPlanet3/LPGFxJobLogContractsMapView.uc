class LPGFxJobLogContractsMapView extends LPGFxMap within GFxMoviePlayer
    config(UI);

struct LegendInfoStruct
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string IconName;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string LegendText;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array ExclusiveMapZoneNames[1073741825];

    structdefaultproperties
    {
        IconName=""
        LegendText=""
        ExclusiveMapZoneNames=none
    }
};

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MapMC;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL WorldMapMC;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TabNavigator;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MapMCWidth;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MapMCHeight;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float WorldMapMCWidth;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float WorldMapMCHeight;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bIconMatrixInitialized;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bInitialWorldMap;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bInitialListOpen;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bInitialListState;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bFastTravelMode;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bViewed;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bMapData;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL LocationsList;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL LegendList;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL JobLogMP;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array LegendInfo[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array FastTravelInfoList;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int MyTabIndex;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array WorldMapIcons;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int WorldMapZonesInitializedTimes[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string LocalMapDispayName[536870913];

function Init()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPPC;

    LPPC = LPPlayerController(Outer.GetPC());
    super.Init();
    SetFloat("dxy_speed", 20.0000000);
    bInitialWorldMap = LPPC.JobLogInfo.MapRecord.bWorldMap;
    bInitialListOpen = LPPC.JobLogInfo.MapRecord.bListOpen;
    bInitialListState = LPPC.JobLogInfo.MapRecord.bListState;
    bFastTravelMode = false;
    // End:0x1CF
    if(LPPC != none)
    {
        // End:0x1CF
        if(LPPC.bOpenJobLogToAutopilot)
        {
            SetBool("bFastTravelMode", true);
            bFastTravelMode = true;
            bInitialWorldMap = true;
            bInitialListOpen = true;
            bInitialListState = true;
        }
    }
    // End:0x1EB
    if(bFastTravelMode == false)
    {
        bInitialListState = false;
    }
    InitWorldMapMC();
    InitWorldMapZones();
    InitWorldMapIcons();
    // End:0x23A
    if(bInitialListOpen)
    {
        // End:0x230
        if(bInitialListState)
        {
            ASOpenLocationsList();            
        }
        else
        {
            ASOpenLegendList();
        }
    }
    // End:0x27F
    if(LPPC != none)
    {
        // End:0x27F
        if(LPPC.bOpenJobLogToAutopilot)
        {
            ASJumpToWorldMap();
            ASOpenLocationsList();
        }
    }
    //return;    
}

function SaveState()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPPC;

    LPPC = LPPlayerController(Outer.GetPC());
    LPPC.JobLogInfo.MapRecord.bWorldMap = GetDisplayingWorldMap();
    LPPC.JobLogInfo.MapRecord.bListOpen = GetListOpenState();
    LPPC.JobLogInfo.MapRecord.bListState = GetListState();
    //return;    
}

function GetDisplayingWorldMap()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return GetBool("bDisplayingWorldMap");
    //return ReturnValue;    
}

function GetListOpenState()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return GetBool("bSlideListActive");
    //return ReturnValue;    
}

function GetListState()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return GetBool("bSlideListLocationsMode");
    //return ReturnValue;    
}

function GetFastTravelMode()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return GetBool("bFastTravelMode");
    //return ReturnValue;    
}

function SetJobLogMoviePlayer()
{
    local /*0x97E50000-0x00000000*/ private @NULL JLMP[8388609];
    local /*0x97E50000-0x00000000*/ private int TabIndex[8388609];

    MyTabIndex = TabIndex;
    JobLogMP = JLMP;
    JobLogMP.SetToggleMapStateDelegate(ToggleMapState);
    JobLogMP.SetSetContractsButtonLegendDelegate(SetContractsButtonLegend);
    //return;    
}

function Cleanup()
{
    local /*0x97E50000-0x00000000*/ private @NULL JLMP[8388609];

    JLMP.SetToggleMapStateDelegate(None);
    JLMP.SetSetContractsButtonLegendDelegate(None);
    //return;    
}

function LoadLocalMap()
{
    local /*0x97E50000-0x00000000*/ private @NULL MyMapInfo;
    local /*0x97E50000-0x00000000*/ private editfixedsize string externalPath, clipName;
    local /*0x97E50000-0x00000000*/ private @NULL mapContainer;
    local /*0x97E50000-0x00000000*/ private int MapIndex;
    local /*0x97E50000-0x00000000*/ private @NULL LPPC, ZoneInfo;

    LPPC = LPPlayerController(Outer.GetPC());
    // End:0x43
    if(LPPC == none)
    {
        return;
    }
    MapIndex = LPPC.JobLogInfo.MapRecord.LocalMapDisplayIndex;
    MyMapInfo = LPMapInfo(LPPC.WorldInfo.GetMapInfo());
    // End:0x346
    if((MyMapInfo != none) && MyMapInfo.ContractsMapDisplayEntries[MapIndex].MapSwfMovie != none)
    {
        mapContainer = GetObject("LocalMapContainer");
        externalPath = "/ package/" $ Repl(PathName(MyMapInfo.ContractsMapDisplayEntries[MapIndex].MapSwfMovie), ".", "/");
        clipName = MyMapInfo.ContractsMapDisplayEntries[MapIndex].movieClipName;
        ASLoadLocalMap(mapContainer, externalPath, clipName);
        // End:0x2AF
        if(LPPC.GetMapZoneInfoFromName(MyMapInfo.ContractsMapDisplayEntries[MapIndex].MapZoneName, ZoneInfo))
        {
            LocalMapDispayName = ZoneInfo.LocalMapDisplayName;
        }
        // End:0x337
        if(MapInfo.ContractsMapDisplayEntries[MapIndex].IconHeightThreshold != float(0))
        {
            IconHeightThreshold = MapInfo.ContractsMapDisplayEntries[MapIndex].IconHeightThreshold;
        }
        bMapData = true;        
    }
    else
    {
        bMapData = false;
        ASSetNoMapData(true);
    }
    //return;    
}

function ASSetNoMapData()
{
    local /*0x97E50000-0x00000000*/ private bool bNoMapData[8388609];

    ActionScriptVoid("SetNoMapData");
    //return;    
}

function ASLoadLocalMap()
{
    local /*0x97E50000-0x00000000*/ private @NULL parentClip[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize string swfPath[8388609], movieClipName;

    ActionScriptVoid("LoadLocalMap");
    //return;    
}

function GetContractPanelPage()
{
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];

    return ActionScriptInt("GetContractPanelPage");
    //return ReturnValue;    
}

function HideWorldMapRegion()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string RegionName[8388609];

    ActionScriptVoid("HideWorldMapRegion");
    //return;    
}

function ShowWorldMapRegion()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string RegionName[8388609];

    ActionScriptVoid("ShowWorldMapRegion");
    //return;    
}

function UpdateJobLogHeaderLabel()
{
    // End:0x34
    if(!bMapData)
    {
        JobLogMP.SetTitleText("", self);        
    }
    else
    {
        // End:0xAD
        if(GetDisplayingWorldMap())
        {
            JobLogMP.SetTitleText(JobLogMP.GetLocalizedString("<Strings:LostPlanetGame.JobLog.WorldMap>"), self);            
        }
        else
        {
            JobLogMP.SetTitleText(JobLogMP.GetLocalizedString(LocalMapDispayName), self);
        }
    }
    //return;    
}

event WidgetInitialized()
{
    local /*0x97E50000-0x00000000*/ private name WidgetName[8388609], WidgetPath;
    local /*0x97E50000-0x00000000*/ private @NULL Widget[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], bWasHandled;
    local /*0x97E50000-0x00000000*/ private @NULL LPPC;

    bWasHandled = true;
    switch(WidgetName)
    {
        // End:0x2E
        case 'ToggleLabel':
            // End:0x265
            break;
        // End:0x3D
        case 'panelTextHeader':
            // End:0x265
            break;
        // End:0x193
        case 'MenuList':
            // End:0xEC
            if(LocationsList == none)
            {
                LocationsList = GFxClikWidget(Widget);
                LocationsList.AddEventListener('CLIK_change', OnLocationsListChange);
                LocationsList.AddEventListener('CLIK_itemPress', OnLocationsListItemPress);
            }
            LPPC = LPPlayerController(Outer.GetPC());
            // End:0x186
            if((LPPC != none) && LPPC.bOpenJobLogToAutopilot)
            {
                LPPC.bOpenJobLogToAutopilot = false;
                UpdateJobLogHeaderLabel();
                PopulateFastTravelList();
            }
            LoadLocalMap();
            // End:0x265
            break;
        // End:0x1C8
        case 'LegendList':
            LegendList = GFxClikWidget(Widget);
            PopulateLegendList();
            // End:0x265
            break;
        // End:0x244
        case 'mapStatus':
            Widget.GetObject("textField").SetText("<Strings:LostPlanetGame.JobLog.NoMapData>");
            // End:0x265
            break;
        // End:0x253
        case 'textInfo':
            // End:0x265
            break;
        // End:0xFFFF
        default:
            bWasHandled = false;
            // End:0x265
            break;
            break;
    }
    // End:0x2A4
    if(!bWasHandled)
    {
        bWasHandled = super(GFxObject).WidgetInitialized(WidgetName, WidgetPath, Widget);
    }
    return bWasHandled;
    //return ReturnValue;    
}

function FastTravel()
{
    local /*0x97E50000-0x00000000*/ private int SelectedIndex[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL FTObj;
    local /*0x97E50000-0x00000000*/ private editfixedsize string TravelURL;
    local /*0x97E50000-0x00000000*/ private @NULL LPPC, BestMovieInfo;

    LPPC = LPPlayerController(Outer.GetPC());
    // End:0x34E
    if((LPPC != none) && FastTravelInfoList.Length > 0)
    {
        FTObj = LPQO_ObjectiveFastTravel(FastTravelInfoList[SelectedIndex].ObjectiveEntry.GetQuestObject());
        // End:0x34E
        if(FTObj != none)
        {
            // End:0x111
            if(FastTravelInfoList[SelectedIndex].TravelURLOVERRIDE != "")
            {
                TravelURL = FastTravelInfoList[SelectedIndex].TravelURLOVERRIDE;                
            }
            else
            {
                TravelURL = FTObj.TravelURL;
            }
            BestMovieInfo = Class'LPFastTravelVolume'.static.GetBestMovieToPlay(LPPC, FastTravelInfoList, SelectedIndex);
            // End:0x271
            if(BestMovieInfo.LoadingMovieName != "")
            {
                // End:0x208
                if(BestMovieInfo.LoadingMovieName ~= Class'Engine.Engine'.static.GetCurrentLoadingMovie())
                {
                    LPPC.ClientShowLoadingMovie(true);                    
                }
                else
                {
                    LPPC.ClientPlayMovie(BestMovieInfo.LoadingMovieName, -1, -1, false, true, true, BestMovieInfo.bLooping);
                }                
            }
            else
            {
                LPPC.ClientShowLoadingMovie(true);
            }
            // End:0x310
            if(BestMovieInfo.bNotSkippable)
            {
                Class'SPEngine.SPSeqAct_SetMovieSkippable'.static.SetMovieSkippable(BestMovieInfo.LoadingMovieName, !BestMovieInfo.bNotSkippable);
            }
            FastTravelInfoList.Length = 0;            
            LPPC.ConsoleCommand(TravelURL);
        }
    }
    //return;    
}

function PopulateLegendList()
{
    local /*0x97E50000-0x00000000*/ private int I, J;
    local /*0x97E50000-0x00000000*/ private @NULL DataProvider, TempObj, LPMI, LPPC;
    local /*0x97E50000-0x00000000*/ private bool bEnable;
    local /*0x97E50000-0x00000000*/ private int ItemIndex;

    LPPC = LPPlayerController(Outer.GetPC());
    LPMI = LPMapInfo(LPPC.WorldInfo.GetMapInfo());
    DataProvider = Outer.CreateArray();
    ItemIndex = 0;
    I = 0;
    J0xB9:

    // End:0x305 [Loop If]
    if(I < LegendInfo.Length)
    {
        bEnable = true;
        // End:0x1D9
        if(LegendInfo[I].ExclusiveMapZoneNames.Length > 0)
        {
            bEnable = false;
            J = 0;
            J0x121:

            // End:0x1D9 [Loop If]
            if(J < LegendInfo[I].ExclusiveMapZoneNames.Length)
            {
                // End:0x1CB
                if((LPMI != none) && LPMI.IsValidMapZone(LegendInfo[I].ExclusiveMapZoneNames[J]) == true)
                {
                    bEnable = true;
                    // [Explicit Break]
                    goto J0x1D9;
                }
                J++;
                // [Loop Continue]
                goto J0x121;
            }
        }
        J0x1D9:

        // End:0x1EB
        if(!bEnable)
        {            
        }
        else
        {
            TempObj = Outer.CreateObject("Object");
            TempObj.SetString("iconName", LegendInfo[I].IconName);
            TempObj.SetString("label", LegendInfo[I].LegendText);
            DataProvider.SetElementObject(ItemIndex, TempObj);
            ItemIndex++;
        }
        I++;
        // [Loop Continue]
        goto J0xB9;
    }
    // End:0x34A
    if(LegendList != none)
    {
        LegendList.SetObject("dataProvider", DataProvider);
    }
    //return;    
}

function PopulateFastTravelList()
{
    local /*0x97E50000-0x00000000*/ private @NULL FTObj;
    local /*0x97E50000-0x00000000*/ private int I;
    local /*0x97E50000-0x00000000*/ private @NULL DataProvider, TempObj;
    local /*0x97E50000-0x00000000*/ private bool bItemFound;
    local /*0x97E50000-0x00000000*/ private @NULL LPPC;
    local /*0x97E50000-0x00000000*/ private name ZoneName;
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL ZoneInfo, LPMI;

    LPPC = LPPlayerController(Outer.GetPC());
    // End:0x53C
    if(LPPC != none)
    {
        LPMI = LPMapInfo(LPPC.WorldInfo.GetMapInfo());
        DataProvider = Outer.CreateArray();
        FastTravelInfoList = LPPC.FastTravelInfoList;
        I = 0;
        J0xE5:

        // End:0x1AA [Loop If]
        if(I < FastTravelInfoList.Length)
        {
            FTObj = LPQO_ObjectiveFastTravel(FastTravelInfoList[I].ObjectiveEntry.GetQuestObject());
            // End:0x19C
            if(FTObj != none)
            {
                // End:0x19C
                if(int(FTObj.GetQuestStatus()) == int(1))
                {
                    FastTravelInfoList.Remove(I--, 1);                    
                }
            }
            I++;
            // [Loop Continue]
            goto J0xE5;
        }
        I = 0;
        J0x1B5:

        // End:0x53C [Loop If]
        if(I < FastTravelInfoList.Length)
        {
            // End:0x52E
            if(FastTravelInfoList[I].ObjectiveEntry != none)
            {
                FTObj = LPQO_ObjectiveFastTravel(FastTravelInfoList[I].ObjectiveEntry.GetQuestObject());
                // End:0x52E
                if(FTObj != none)
                {
                    // End:0x52E
                    if(int(FTObj.GetQuestStatus()) != int(1))
                    {
                        TempObj = Outer.CreateObject("Object");
                        TempObj.SetString("label", FTObj.Description);
                        ZoneName = FTObj.MapZoneName;
                        // End:0x48F
                        if(ZoneName != 'None')
                        {
                            // End:0x3BA
                            if(LPPC.GetMapZoneInfoFromName(ZoneName, ZoneInfo))
                            {
                                TempObj.SetString("movieClipName", ZoneInfo.WorldMapMovieClipName);                                
                            }
                            else
                            {
                                TempObj.SetString("movieClipName", "");
                            }
                            // End:0x45B
                            if((LPMI != none) && LPMI.IsValidMapZone(ZoneName))
                            {
                                TempObj.SetBool("bIsPlayerRegion", true);                                
                            }
                            else
                            {
                                TempObj.SetBool("bIsPlayerRegion", false);
                            }                            
                        }
                        else
                        {
                            TempObj.SetString("movieClipName", "");
                            TempObj.SetBool("bIsPlayerRegion", false);
                        }
                        DataProvider.SetElementObject(I, TempObj);
                        bItemFound = true;
                    }
                }
            }
            I++;
            // [Loop Continue]
            goto J0x1B5;
        }
    }
    // End:0x5FB
    if(LocationsList != none)
    {
        LocationsList.SetFloat("selectedIndex", 0.0000000);
        LocationsList.SetObject("dataProvider", DataProvider);
        LocationsList.SetString("wrapping", ((bItemFound) ? "wrap" : "normal"));
    }
    //return;    
}

function InitWorldMapZones()
{
    local /*0x97E50000-0x00000000*/ private int I;
    local /*0x97E50000-0x00000000*/ private @NULL LPPC, DataProvider, TempObj;
    local /*0x97E50000-0x00000000*/ private bool bVisible, bIsPlayerRegion;
    local /*0x97E50000-0x00000000*/ private @NULL LPMI;
    local /*0x97E50000-0x00000000*/ private name CurrentZoneID;
    local /*0x97E50000-0x00000000*/ private editfixedsize string CurrentZoneMovieClipName;
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL ZoneInfo;
    local /*0x97E50000-0x00000000*/ private editfixedsize array VisibleMapZoneClips, PlayerMapZoneClips;
    local /*0x97E50000-0x00000000*/ private int FoundIndex;
    local /*0x97E50000-0x00000000*/ private @NULL FTObj, GameDataStore, QM;
    local /*0x97E50000-0x00000000*/ private editfixedsize array LocalQuestCache;
    local /*0x97E50000-0x00000000*/ private int ObjectiveIdx, HideZoneIdx;
    local /*0x97E50000-0x00000000*/ private @NULL ObjBool, ObjFloat;

    // End:0x12
    if(WorldMapZonesInitializedTimes > 2)
    {
        return;
    }
    LPPC = LPPlayerController(Outer.GetPC());
    // End:0x55
    if(LPPC == none)
    {
        return;
    }
    DataProvider = Outer.CreateArray();
    LPMI = LPMapInfo(LPPC.WorldInfo.GetMapInfo());
    // End:0x1B3
    if(LPMI != none)
    {
        CurrentZoneID = LPMI.GetZoneIDFromIndex(LPPC.JobLogInfo.MapRecord.LocalMapDisplayIndex);
        // End:0x1B3
        if(CurrentZoneID != 'None')
        {
            // End:0x1B3
            if(LPPC.GetMapZoneInfoFromName(CurrentZoneID, ZoneInfo))
            {
                CurrentZoneMovieClipName = ZoneInfo.WorldMapMovieClipName;
            }
        }
    }
    I = 0;
    J0x1BE:

    // End:0x343 [Loop If]
    if(I < LPPC.MapZones.Length)
    {
        // End:0x290
        if(LPPC.IsMapZoneVisited(LPPC.MapZones[I].ZoneNameID))
        {
            VisibleMapZoneClips.AddItem(LPPC.MapZones[I].WorldMapMovieClipName);            
        }
        // End:0x335
        if(LPMI.IsValidMapZone(LPPC.MapZones[I].ZoneNameID))
        {
            PlayerMapZoneClips.AddItem(LPPC.MapZones[I].WorldMapMovieClipName);            
        }
        I++;
        // [Loop Continue]
        goto J0x1BE;
    }
    // End:0x4A7
    if(bFastTravelMode)
    {
        I = 0;
        J0x35B:

        // End:0x4A7 [Loop If]
        if(I < LPPC.FastTravelInfoList.Length)
        {
            FTObj = LPQO_ObjectiveFastTravel(LPPC.FastTravelInfoList[I].ObjectiveEntry.GetQuestObject());
            // End:0x499
            if((FTObj != none) && int(FTObj.GetQuestStatus()) != int(1))
            {
                // End:0x499
                if(LPPC.GetMapZoneInfoFromName(FTObj.MapZoneName, ZoneInfo))
                {
                    VisibleMapZoneClips.AddItem(ZoneInfo.WorldMapMovieClipName);                    
                }
            }
            I++;
            // [Loop Continue]
            goto J0x35B;
        }
    }
    GameDataStore = SPDataStorePersistentGameData(Class'Engine.UIRoot'.static.StaticResolveDataStore(Class'SPEngine.SPDataStorePersistentGameData'.default.Tag));
    // End:0x936
    if(GameDataStore.QuestManager != none)
    {
        QM = GameDataStore.QuestManager;
        QM.QuestTuneDataContainer.GetAllQuests(LocalQuestCache);
        I = 0;
        J0x58C:

        // End:0x936 [Loop If]
        if(I < LocalQuestCache.Length)
        {
            // End:0x5DB
            if(int(LocalQuestCache[I].GetQuestStatus()) != int(3))
            {                
            }
            else
            {
                ObjectiveIdx = 0;
                J0x5E6:

                // End:0x928 [Loop If]
                if(ObjectiveIdx < LocalQuestCache[I].Objectives.Length)
                {
                    // End:0x673
                    if(int(LocalQuestCache[I].Objectives[ObjectiveIdx].GetQuestStatus()) != int(3))
                    {                        
                    }
                    else
                    {
                        ObjBool = LPQO_ObjectiveBool(LocalQuestCache[I].Objectives[ObjectiveIdx]);
                        // End:0x7C8
                        if(ObjBool != none)
                        {
                            HideZoneIdx = 0;
                            J0x6D2:

                            // End:0x7C5 [Loop If]
                            if(HideZoneIdx < ObjBool.HideWorldMapZones.Length)
                            {
                                // End:0x7B7
                                if(LPPC.GetMapZoneInfoFromName(ObjBool.HideWorldMapZones[HideZoneIdx].ZoneName, ZoneInfo))
                                {
                                    VisibleMapZoneClips.RemoveItem(ZoneInfo.WorldMapMovieClipName);                                    
                                    PlayerMapZoneClips.RemoveItem(ZoneInfo.WorldMapMovieClipName);                                    
                                }
                                HideZoneIdx++;
                                // [Loop Continue]
                                goto J0x6D2;
                            }                            
                        }
                        else
                        {
                            ObjFloat = LPQO_ObjectiveFloat(LocalQuestCache[I].Objectives[ObjectiveIdx]);
                            // End:0x91A
                            if(ObjFloat != none)
                            {
                                HideZoneIdx = 0;
                                J0x827:

                                // End:0x91A [Loop If]
                                if(HideZoneIdx < ObjBool.HideWorldMapZones.Length)
                                {
                                    // End:0x90C
                                    if(LPPC.GetMapZoneInfoFromName(ObjFloat.HideWorldMapZones[HideZoneIdx].ZoneName, ZoneInfo))
                                    {
                                        VisibleMapZoneClips.RemoveItem(ZoneInfo.WorldMapMovieClipName);                                        
                                        PlayerMapZoneClips.RemoveItem(ZoneInfo.WorldMapMovieClipName);                                        
                                    }
                                    HideZoneIdx++;
                                    // [Loop Continue]
                                    goto J0x827;
                                }
                            }
                        }
                    }
                    ObjectiveIdx++;
                    // [Loop Continue]
                    goto J0x5E6;
                }
            }
            I++;
            // [Loop Continue]
            goto J0x58C;
        }
    }
    I = 0;
    J0x941:

    // End:0xD91 [Loop If]
    if(I < LPPC.MapZones.Length)
    {
        TempObj = Outer.CreateObject("Object");
        TempObj.SetString("label", LPPC.MapZones[I].DisplayName);
        TempObj.SetString("subLabel", LPPC.MapZones[I].DisplayNameSubLevel);
        TempObj.SetString("subLabel2", LPPC.MapZones[I].DisplayNameSubLevel2);
        TempObj.SetString("movieClipName", LPPC.MapZones[I].WorldMapMovieClipName);
        TempObj.SetString("regionMovieClipName", LPPC.MapZones[I].WorldMapRegionMovieClipName);
        TempObj.SetString("region", LPPC.MapZones[I].WorldMapRegionMovieClipName);
        FoundIndex = VisibleMapZoneClips.Find(LPPC.MapZones[I].WorldMapMovieClipName);        
        bVisible = FoundIndex != -1;
        TempObj.SetBool("bVisible", bVisible);
        FoundIndex = PlayerMapZoneClips.Find(LPPC.MapZones[I].WorldMapMovieClipName);        
        bIsPlayerRegion = FoundIndex != -1;
        TempObj.SetBool("bIsPlayerRegion", bIsPlayerRegion);
        DataProvider.SetElementObject(I, TempObj);
        I++;
        // [Loop Continue]
        goto J0x941;
    }
    ASSetWorldMapDataProvider(DataProvider);
    ASUpdateWorldMapRegions(CurrentZoneMovieClipName);
    WorldMapZonesInitializedTimes++;
    //return;    
}

function ASSetWorldMapDataProvider()
{
    local /*0x97E50000-0x00000000*/ private @NULL DP[8388609];

    ActionScriptVoid("SetWorldMapDataProvider");
    //return;    
}

function ASUpdateWorldMapRegions()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string CurrentZoneMovieClipName[8388609];

    ActionScriptVoid("UpdateWorldMapRegions");
    //return;    
}

function OnLocationsListItemPress()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL ev[8388609];

    FastTravel(ev.Index);
    //return;    
}

function OnLocationsListChange()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL ev[8388609], Data, Obj;
    local /*0x97E50000-0x00000000*/ private editfixedsize string highlightMovieClipName;

    highlightMovieClipName = "";
    Data = LocationsList.GetObject("dataProvider");
    // End:0xE0
    if(Data != none)
    {
        Obj = Data.GetElementObject(ev.Index);
        // End:0xE0
        if(Obj != none)
        {
            highlightMovieClipName = Obj.GetString("movieClipName");
        }
    }
    ASUpdateWorldMapRegions(highlightMovieClipName);
    JobLogMP.PlaySoundFromTheme('Select');
    //return;    
}

function ASJumpToWorldMap()
{
    ActionScriptVoid("JumpToWorldMap");
    //return;    
}

function ASJumpToLocalMap()
{
    ActionScriptVoid("JumpToLocalMap");
    //return;    
}

function ASOpenLocationsList()
{
    ActionScriptVoid("OpenLocationsList");
    //return;    
}

function ASOpenLegendList()
{
    ActionScriptVoid("OpenLegendList");
    //return;    
}

function SetObjectiveIconAlpha()
{
    local /*0x97E50000-0x00000000*/ private int SelectedIndex[8388609], iconIdx, NewAlpha;
    local /*0x97E50000-0x00000000*/ private @NULL DI, LPPC;

    LPPC = LPPlayerController(Outer.GetPC());
    // End:0x120
    if(LPPC != none)
    {
        DI = MapIcons[8].IconArray[iconIdx].Icon.GetDisplayInfo();
        DI.Alpha = float(NewAlpha);
        MapIcons[8].IconArray[iconIdx].Icon.SetDisplayInfo(DI);
    }
    //return;    
}

function InitMapIcons()
{
    local /*0x97E50000-0x00000000*/ private int I;

    I = 0;
    J0x0B:

    // End:0x91 [Loop If]
    if(I < MapIcons.Length)
    {
        MapIcons[I].ContainerMC = MapMC;
        MapIcons[I].WorldMapContainerMC = WorldMapMC;
        I++;
        // [Loop Continue]
        goto J0x0B;
    }
    //return;    
}

function SetMapMC()
{
    local /*0x97E50000-0x00000000*/ private @NULL MC[8388609];

    MapMC = MC;
    // End:0xF7
    if(MapMC != none)
    {
        MapMCWidth = MapMC.GetFloat("_width");
        MapMCHeight = MapMC.GetFloat("_height");
        SetFloat("mapW", MapMCWidth);
        SetFloat("mapH", MapMCHeight);
        SetFloat("defaultMapW", MapMCWidth);
        SetFloat("defaultMapH", MapMCWidth);
    }
    InitMapIcons();
    // End:0x11B
    if(bInitialWorldMap)
    {
        ASJumpToWorldMap();        
    }
    else
    {
        ASJumpToLocalMap();
    }
    //return;    
}

function InitWorldMapMC()
{
    WorldMapMC = GetObject("WorldMapMovieClip");
    // End:0xDF
    if(WorldMapMC != none)
    {
        WorldMapMCWidth = WorldMapMC.GetFloat("_width");
        WorldMapMCHeight = WorldMapMC.GetFloat("_height");
        SetFloat("WorldMapWidth", WorldMapMCWidth);
        SetFloat("WorldMapHeight", WorldMapMCHeight);
    }
    //return;    
}

function Update()
{
    local /*0x97E50000-0x00000000*/ private float Scale[8388609];

    super.Update(Scale);
    UpdateWorldMapIcons();
    //return;    
}

function UpdateIconsForMapActors()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize array MapActors[25165825];

    super.UpdateIconsForMapActors(MapActors);
    //return;    
}

function InitWorldMapIcons()
{
    local /*0x97E50000-0x00000000*/ private @NULL GameDataStore, QM, Q, Obj;
    local /*0x97E50000-0x00000000*/ private int QuestIdx, ObjectiveIdx;
    local /*0x97E50000-0x00000000*/ private @NULL LPQC;
    local /*0x97E50000-0x00000000*/ private editfixedsize array WorldMapIconQuests;
    local /*0x97E50000-0x00000000*/ private @NULL BObj, FObj;

    // End:0x11
    if(WorldMapMC == none)
    {
        return;
    }
    GameDataStore = SPDataStorePersistentGameData(Class'Engine.UIRoot'.static.StaticResolveDataStore(Class'SPEngine.SPDataStorePersistentGameData'.default.Tag));
    // End:0x38A
    if(GameDataStore.QuestManager != none)
    {
        QM = GameDataStore.QuestManager;
        LPQC = LPQuestTuneDataContainer(QM.QuestTuneDataContainer);
        // End:0x38A
        if(LPQC != none)
        {
            LPQC.GetAllQuests(WorldMapIconQuests);
            QuestIdx = 0;
            J0x121:

            // End:0x38A [Loop If]
            if(QuestIdx < WorldMapIconQuests.Length)
            {
                Q = LPQO_Quest(WorldMapIconQuests[QuestIdx]);
                // End:0x171
                if(Q == none)
                {                    
                }
                else
                {
                    // End:0x19E
                    if(int(Q.GetQuestStatus()) != int(3))
                    {                        
                    }
                    else
                    {
                        ObjectiveIdx = 0;
                        J0x1A9:

                        // End:0x37C [Loop If]
                        if(ObjectiveIdx < Q.Objectives.Length)
                        {
                            Obj = Q.Objectives[ObjectiveIdx];
                            // End:0x21A
                            if(Obj == none)
                            {                                
                            }
                            else
                            {
                                // End:0x247
                                if(int(Obj.GetQuestStatus()) != int(3))
                                {                                    
                                }
                                else
                                {
                                    BObj = LPQO_ObjectiveBool(Obj);
                                    // End:0x2DC
                                    if(BObj != none)
                                    {
                                        // End:0x2D9
                                        if(int(BObj.WorldMapIcon.IconType) != int(0))
                                        {
                                            WorldMapIcons.AddItem(BObj.WorldMapIcon);                                            
                                        }                                        
                                    }
                                    else
                                    {
                                        FObj = LPQO_ObjectiveFloat(Obj);
                                        // End:0x36E
                                        if(FObj != none)
                                        {
                                            // End:0x36E
                                            if(int(FObj.WorldMapIcon.IconType) != int(0))
                                            {
                                                WorldMapIcons.AddItem(FObj.WorldMapIcon);                                                
                                            }
                                        }
                                    }
                                }
                            }
                            ObjectiveIdx++;
                            // [Loop Continue]
                            goto J0x1A9;
                        }
                    }
                }
                QuestIdx++;
                // [Loop Continue]
                goto J0x121;
            }
        }
    }
    //return;    
}

function UpdateWorldMapIcons()
{
    local /*0x97E50000-0x00000000*/ private int I;
    local /*0x97E50000-0x00000000*/ private editfixedsize array WorldMapActors;
    local /*0x97E50000-0x00000000*/ private @NULL M;

    I = 0;
    J0x0B:

    // End:0x1F6 [Loop If]
    if(I < WorldMapIcons.Length)
    {
        M.IconType = WorldMapIcons[I].IconType;
        M.bIconStaysOnEdge = false;
        M.bRotatesWithActor = false;
        M.Actor = none;
        M.bSkipTransform = true;
        M.bWorldMapContainer = true;
        M.NonActorLocation.X = WorldMapIcons[I].MapCoordinate.X;
        M.NonActorLocation.Y = WorldMapIcons[I].MapCoordinate.Y;
        WorldMapActors.AddItem(M);        
        I++;
        // [Loop Continue]
        goto J0x0B;
    }
    // End:0x219
    if(WorldMapActors.Length > 0)
    {
        UpdateIconsForMapActors(WorldMapActors);
    }
    //return;    
}

function SetIconMatrix()
{
    local /*0x97E50000-0x00000000*/ private float Scale[8388609], F;
    local /*0x97E50000-0x00000000*/ private @NULL LPMI, MapCenter;
    local /*0x97E50000-0x00000000*/ private float ScaleX, ScaleY;
    local /*0x97E50000-0x00000000*/ private @NULL ScaleMatrix;
    local /*0x97E50000-0x00000000*/ private float MapWorldWidth, MapWorldHeight;

    // End:0x11
    if(MapMC == none)
    {
        return;
    }
    // End:0x20
    if(bIconMatrixInitialized)
    {
        return;
    }
    MapWorldWidth = 0.0000000;
    LPMI = LPMapInfo(Outer.GetPC().WorldInfo.GetMapInfo());
    // End:0x1BA
    if(LPMI != none)
    {
        MapWorldWidth = LPMI.MapExtent.Y * float(2);
        MapWorldHeight = LPMI.MapExtent.X * float(2);
        MapCenter.X = LPMI.MapCenter.X;
        MapCenter.Y = LPMI.MapCenter.Y;
    }
    ScaleX = MapMCWidth / MapWorldWidth;
    ScaleY = MapMCHeight / MapWorldHeight;
    // End:0x207
    if(MapWorldWidth == float(0))
    {
    }
    F = float(-(0 + 16384) & 65535) * (3.1415930 / 32768.0000000);
    IconMatrix.XPlane.X = Cos(F);
    IconMatrix.XPlane.Y = Sin(F);
    IconMatrix.YPlane.X = -Sin(F);
    IconMatrix.YPlane.Y = Cos(F);
    ScaleMatrix.XPlane.X = ScaleX;
    ScaleMatrix.YPlane.Y = ScaleY;
    IconMatrix = Multiply_MatrixMatrix(IconMatrix, ScaleMatrix);
    IconMatrix.WPlane.X = 0.0000000;
    IconMatrix.WPlane.Y = 0.0000000;
    IconMatrix.WPlane.Z = 0.0000000;
    IconMatrix.WPlane.W = 1.0000000;
    IconMatrix.WPlane = TransformVector(IconMatrix, -MapCenter);
    CenterMapOnPlayer();
    bIconMatrixInitialized = true;
    //return;    
}

function CenterMapOnPlayer()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPPC;

    LPPC = LPPlayerController(Outer.GetPC());
    // End:0x8F
    if((LPPC != none) && LPPC.Pawn != none)
    {
        CenterMapOnActor(LPPC.Pawn);
    }
    //return;    
}

function CenterMapOnActor()
{
    local /*0x97E50000-0x00000000*/ private @NULL inActor[8388609], V;

    V = TransformVector(IconMatrix, inActor.Location);
    ASCenterMap(V.X, V.Y, false);
    //return;    
}

function ASCenterMap()
{
    local /*0x97E50000-0x00000000*/ private float mapX[8388609], mapY;
    local /*0x97E50000-0x00000000*/ private bool bWorldMap[8388609];

    ActionScriptVoid("CenterMap");
    //return;    
}

function ToggleMapState()
{
    local /*0x97E50000-0x00000000*/ private bool bWorldMap[8388609];

    //return;    
}

function DPadButtonPressed()
{
    local /*0x97E50000-0x00000000*/ private int Idx[8388609];
    local /*0x97E50000-0x00000000*/ private bool bPressed[8388609];
    local /*0x97E50000-0x00000000*/ private int I;

    ASDPadButtonPressed(Idx, bPressed);
    // End:0x7E
    if(bPressed)
    {
        I = 0;
        J0x35:

        // End:0x7E [Loop If]
        if(I < 4)
        {
            // End:0x70
            if(I != Idx)
            {
                ASDPadButtonPressed(I, false);
            }
            I++;
            // [Loop Continue]
            goto J0x35;
        }
    }
    //return;    
}

function ASDPadButtonPressed()
{
    local /*0x97E50000-0x00000000*/ private int Idx[8388609];
    local /*0x97E50000-0x00000000*/ private bool bPressed[8388609];

    ActionScriptVoid("DPadButtonPressed");
    //return;    
}

function GamePadLeftStickButtonPressed()
{
    local /*0x97E50000-0x00000000*/ private int Idx[8388609];
    local /*0x97E50000-0x00000000*/ private bool bPressed[8388609];
    local /*0x97E50000-0x00000000*/ private int I;

    ASGamePadLeftStickButtonPressed(Idx, bPressed);
    // End:0x7E
    if(bPressed)
    {
        I = 0;
        J0x35:

        // End:0x7E [Loop If]
        if(I < 4)
        {
            // End:0x70
            if(I != Idx)
            {
                ASGamePadLeftStickButtonPressed(I, false);
            }
            I++;
            // [Loop Continue]
            goto J0x35;
        }
    }
    //return;    
}

function ASGamePadLeftStickButtonPressed()
{
    local /*0x97E50000-0x00000000*/ private int Idx[8388609];
    local /*0x97E50000-0x00000000*/ private bool bPressed[8388609];

    ActionScriptVoid("GamePadLeftStickButtonPressed");
    //return;    
}

function TriggerButtonPressed()
{
    local /*0x97E50000-0x00000000*/ private int Idx[8388609];
    local /*0x97E50000-0x00000000*/ private bool bPressed[8388609];
    local /*0x97E50000-0x00000000*/ private int I;

    ASTriggerButtonPressed(Idx, bPressed);
    // End:0x7E
    if(bPressed)
    {
        I = 0;
        J0x35:

        // End:0x7E [Loop If]
        if(I < 2)
        {
            // End:0x70
            if(I != Idx)
            {
                ASTriggerButtonPressed(I, false);
            }
            I++;
            // [Loop Continue]
            goto J0x35;
        }
    }
    //return;    
}

function ASTriggerButtonPressed()
{
    local /*0x97E50000-0x00000000*/ private int Idx[8388609];
    local /*0x97E50000-0x00000000*/ private bool bPressed[8388609];

    ActionScriptVoid("TriggerButtonPressed");
    //return;    
}

event FilterButtonInput()
{
    local /*0x97E50000-0x00000000*/ private int ControllerId[8388609];
    local /*0x97E50000-0x00000000*/ private name ButtonName[8388609];
    local /*0x97E50000-0x00000000*/ private byte InputEvent[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], Retval;

    Retval = false;
    switch(ButtonName)
    {
        // End:0x61
        case 'Gamepad_LeftStick_Left':
            GamePadLeftStickButtonPressed(3, (int(InputEvent) == int(0)) || int(InputEvent) == int(2));
            // End:0x2E0
            break;
        // End:0xA2
        case 'Gamepad_LeftStick_Right':
            GamePadLeftStickButtonPressed(1, (int(InputEvent) == int(0)) || int(InputEvent) == int(2));
            // End:0x2E0
            break;
        // End:0xE3
        case 'Gamepad_LeftStick_Up':
            GamePadLeftStickButtonPressed(0, (int(InputEvent) == int(0)) || int(InputEvent) == int(2));
            // End:0x2E0
            break;
        // End:0x125
        case 'Gamepad_LeftStick_Down':
            GamePadLeftStickButtonPressed(2, (int(InputEvent) == int(0)) || int(InputEvent) == int(2));
            // End:0x2E0
            break;
        // End:0x131
        case 'XboxTypeS_DPad_Left':
        // End:0x173
        case 'Left':
            DPadButtonPressed(3, (int(InputEvent) == int(0)) || int(InputEvent) == int(2));
            // End:0x2E0
            break;
        // End:0x17F
        case 'XboxTypeS_DPad_Right':
        // End:0x1C0
        case 'Right':
            DPadButtonPressed(1, (int(InputEvent) == int(0)) || int(InputEvent) == int(2));
            // End:0x2E0
            break;
        // End:0x1CC
        case 'XboxTypeS_DPad_Up':
        // End:0x20D
        case 'Up':
            DPadButtonPressed(0, (int(InputEvent) == int(0)) || int(InputEvent) == int(2));
            // End:0x2E0
            break;
        // End:0x219
        case 'XboxTypeS_DPad_Down':
        // End:0x25B
        case 'Down':
            DPadButtonPressed(2, (int(InputEvent) == int(0)) || int(InputEvent) == int(2));
            // End:0x2E0
            break;
        // End:0x29C
        case 'XboxTypeS_LeftTrigger':
            TriggerButtonPressed(0, (int(InputEvent) == int(0)) || int(InputEvent) == int(2));
            // End:0x2E0
            break;
        // End:0x2DD
        case 'XboxTypeS_RightTrigger':
            TriggerButtonPressed(1, (int(InputEvent) == int(0)) || int(InputEvent) == int(2));
            // End:0x2E0
            break;
        // End:0xFFFF
        default:
            break;
    }
    return Retval;
    //return ReturnValue;    
}

function ShouldDisplayMapIcons()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

function SetContractsButtonLegend()
{
    local /*0x97E50000-0x00000000*/ private bool bSlideListActive[8388609], bDisplayingWorldMap, bInFastTravelMode;
    local /*0x97E50000-0x00000000*/ private editfixedsize string s1, s2, s3, s4, s5, s6;

    // End:0x2F
    if(!JobLogMP.IsCurrentJoblogViewIndex(MyTabIndex))
    {
        return;
    }
    s1 = "<Strings:LostPlanetGame.JobLog.Zoom>";
    s3 = "<Strings:LostPlanetGame.JobLog.Legend>";
    s6 = "";
    // End:0x1C5
    if(bInFastTravelMode)
    {
        // End:0x106
        if(bSlideListActive && (GetListState()) == true)
        {
            s2 = "<Strings:LostPlanetGame.JobLog.SelectLocation>";            
        }
        else
        {
            s2 = "<Strings:LostPlanetGame.JobLog.Pan>";
        }
        // End:0x17B
        if(bSlideListActive)
        {
            s4 = "<Strings:LostPlanetGame.JobLog.LegendType>";            
        }
        else
        {
            s4 = " ";
        }
        s6 = "<Strings:LostPlanetGame.UI.ButtonAcceptSelect>";        
    }
    else
    {
        // End:0x23E
        if(bDisplayingWorldMap)
        {
            s2 = "<Strings:LostPlanetGame.JobLog.Pan>";
            s4 = "<Strings:LostPlanetGame.JobLog.ButtonLocalMap>";            
        }
        else
        {
            s2 = "<Strings:LostPlanetGame.JobLog.Pan>";
            s4 = "<Strings:LostPlanetGame.JobLog.ButtonWorldMap>";
        }
    }
    s5 = "<Strings:LostPlanetGame.UI.ButtonBack>";
    JobLogMP.SetButtonLegendLabelStrings(s1, s2, s3, s4, s5, s6, self);
    JobLogMP.ASRepositionButtonPrompts();
    UpdateJobLogHeaderLabel();
    //return;    
}

function PressLabel2()
{
    //return;    
}

function PressLabel3()
{
    JobLogMP.CancelJobLog();
    //return;    
}

function PressLabel4()
{
    JobLogMP.CancelJobLog();
    //return;    
}

function Viewed()
{
    bViewed = true;
    SetContractsButtonLegend(GetListOpenState(), GetDisplayingWorldMap(), bFastTravelMode);
    //return;    
}

function UnViewed()
{
    local /*0x97E50000-0x00000000*/ private int I;

    I = 0;
    J0x0B:

    // End:0x51 [Loop If]
    if(I < 4)
    {
        DPadButtonPressed(I, false);
        GamePadLeftStickButtonPressed(I, false);
        I++;
        // [Loop Continue]
        goto J0x0B;
    }
    //return;    
}

function PostWidgetInit()
{
    InitWorldMapZones();
    //return;    
}

defaultproperties
{
    LegendInfo=/* Array type was not detected. */
    bDisplayPlayerPawn=true
    bMapRotatesWithView=false
    SubWidgetBindings=/* Array type was not detected. */
}