class LPGFxFrontEnd_Statistics extends LPGFxFrontEnd_Screen within GFxMoviePlayer
    config(UI);

const TotalWidgetCount = 5;

enum eStatDisplayType
{
    StatDisplay_Default,            // 0
    StatDisplay_Credits,            // 1
    StatDisplay_Ratio,              // 2
    StatDisplay_Percentage,         // 3
    StatDisplay_Time,               // 4
    StatDisplay_Rank,               // 5
    StatDisplay_Difference,         // 6
    StatDisplay_Sum,                // 7
    StatDisplay_MAX                 // 8
};

struct RecordWidgetItem
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL Widget;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bCurrentState;

    structdefaultproperties
    {
        Widget=none
        bCurrentState=false
    }
};

struct StatCategoryStruct
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private name CategoryName[1073741825];
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte GameType[1073741825];
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bStatsRead;

    structdefaultproperties
    {
        CategoryName="None"
        GameType=EMPGameType.EMPGT_Default
        bStatsRead=false
    }
};

struct StatDisplayStruct
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private name DisplayCategory[1073741825];
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private int LineNumber[1073741825];
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private name DisplayName[1073741825];
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte DisplayType[1073741825];
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte GameType[1073741825];
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array StatColumns[1073741825];
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array StatNames[1073741825];
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string DisplayString;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string DisplayValue;

    structdefaultproperties
    {
        DisplayCategory="None"
        LineNumber=0
        DisplayName="None"
        DisplayType=eStatDisplayType.StatDisplay_Default
        GameType=EMPGameType.EMPGT_Default
        StatColumns=none
        StatNames=none
        DisplayString=""
        DisplayValue=""
    }
};

var(0.25_Pct) /*0x97E50000-0x00000000*/ private int WidgetCount[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bAllWidgetsInit[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bUseLocalStats[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bStatsReadSuccessful[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bStatsReadInProgress[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array WidgetList;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array StatCategories[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array StatDisplayInfo[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int CurStatCategory;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL StatManager[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL StatsInterface[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL StatsRead[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte StatsReadGameType[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array StatsPlayerIds[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL SortLabel;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL PageLabel;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL BackLabel;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL SelectLabel;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL DetailsLabel;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL GamerCardLabel;
//var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> __StatFilter__Delegate;
//var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> __StatSort__Delegate;
//var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> __ReadOnlineStatsComplete__Delegate;
//var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> __StatFilter_Category__Delegate;
//var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> __StatSort_LineNum__Delegate;

delegate StatFilter()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL A[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

delegate StatSort()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL A[8388609], B;
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];

    //return ReturnValue;    
}

function OnTopMostView()
{
    local /*0x97E50000-0x00000000*/ private bool bPlayOpenAnimation[9437185];
    local /*0x97E50000-0x00000000*/ private name previousView[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL focusObj;

    false
    'None'
    super.OnTopMostView(bPlayOpenAnimation, previousView);
    focusObj = GetObject("statisticsContainer").GetObject("statisticsList");
    MenuViewLoader.SetSelectionFocus(focusObj);
    MoviePlayer.SetExternalInterface(self);
    StatsInterface = Class'Engine.GameEngine'.static.GetOnlineSubsystem().StatsInterface;
    SetUpButtonLegend();
    //return;    
}

function OnViewStackPositionChanged()
{
    local /*0x97E50000-0x00000000*/ private name nextViewName[9437185];

    CancelRead();
    super.OnViewStackPositionChanged(nextViewName);
    //return;    
}

function OnViewUnloaded()
{
    CancelRead();
    super.OnViewUnloaded();
    //return;    
}

function SetUpButtonLegend()
{
    ActionScriptVoid("SetUpButtonLegend");
    //return;    
}

function NotifyUsingGamepad()
{
    local /*0x97E50000-0x00000000*/ private bool bGamepad[8388609];

    RefreshButtonPrompts();
    //return;    
}

function RefreshButtonPrompts()
{
    // End:0x81
    if(SortLabel != none)
    {
        SortLabel.SetText(GetLocalizedString("<Strings:LostPlanetGame.LPGFxFrontEnd_PlayerRecords.Widget_SortString>"));
    }
    // End:0x102
    if(PageLabel != none)
    {
        PageLabel.SetText(GetLocalizedString("<Strings:LostPlanetGame.LPGFxFrontEnd_PlayerRecords.Widget_PageString>"));
    }
    // End:0x183
    if(BackLabel != none)
    {
        BackLabel.SetText(GetLocalizedString("<Strings:LostPlanetGame.LPGFxFrontEnd_PlayerRecords.Widget_BackString>"));
    }
    // End:0x206
    if(SelectLabel != none)
    {
        SelectLabel.SetText(GetLocalizedString("<Strings:LostPlanetGame.LPGFxFrontEnd_PlayerRecords.Widget_SelectString>"));
    }
    // End:0x28A
    if(DetailsLabel != none)
    {
        DetailsLabel.SetText(GetLocalizedString("<Strings:LostPlanetGame.LPGFxFrontEnd_PlayerRecords.Widget_DetailsString>"));
    }
    // End:0x30A
    if(GamerCardLabel != none)
    {
        GamerCardLabel.SetText(GetLocalizedString("<Strings:LostPlanetGame.LPGFxFrontEnd_PlayerRecords.Widget_GamerCard>"));
    }
    //return;    
}

event WidgetInitialized()
{
    local /*0x97E50000-0x00000000*/ private name WidgetName[8388609], WidgetPath;
    local /*0x97E50000-0x00000000*/ private @NULL Widget[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private editfixedsize string LocalizedString;
    local /*0x97E50000-0x00000000*/ private bool bResult;
    local /*0x97E50000-0x00000000*/ private @NULL WI;

    WI.Widget = Widget;
    WI.bCurrentState = Widget.GetBool("disabled");
    WidgetList.AddItem(WI);    
    bResult = super.WidgetInitialized(WidgetName, WidgetPath, Widget);
    // End:0xF6
    if(WidgetName == 'SortString')
    {
        SortLabel = Widget;
        RefreshButtonPrompts();
        bResult = true;        
    }
    else
    {
        // End:0x139
        if(WidgetName == 'PageString')
        {
            PageLabel = Widget;
            RefreshButtonPrompts();
            bResult = true;            
        }
        else
        {
            // End:0x17C
            if(WidgetName == 'BackString')
            {
                BackLabel = Widget;
                RefreshButtonPrompts();
                bResult = true;                
            }
            else
            {
                // End:0x1BF
                if(WidgetName == 'SelectString')
                {
                    SelectLabel = Widget;
                    RefreshButtonPrompts();
                    bResult = true;                    
                }
                else
                {
                    // End:0x202
                    if(WidgetName == 'DetailsString')
                    {
                        DetailsLabel = Widget;
                        RefreshButtonPrompts();
                        bResult = true;                        
                    }
                    else
                    {
                        // End:0x245
                        if(WidgetName == 'GamerCard')
                        {
                            GamerCardLabel = Widget;
                            RefreshButtonPrompts();
                            bResult = true;                            
                        }
                        else
                        {
                            LocalizedString = GetLocalizedStringShort("Widget_" $ string(WidgetName));
                            // End:0x2BA
                            if(IsLocalizationSuccessful(LocalizedString))
                            {
                                Widget.SetText(LocalizedString);
                                bResult = true;
                            }
                        }
                    }
                }
            }
        }
    }
    // End:0x310
    if(WidgetName == 'statisticsList')
    {
        // End:0x310
        if(ListMC == none)
        {
            ListMC = GFxClikWidget(Widget);
            SetList(ListMC);
        }
    }
    WidgetCount++;
    // End:0x341
    if(WidgetCount == 5)
    {
        bAllWidgetsInit = true;
        OnAllWidgetsInit();
    }
    return bResult;
    //return ReturnValue;    
}

function GetLocalizedStringShort()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string ShortPath[8388609], ReturnValue;

    return GetLocalizedString(("<Strings:LostPlanetGame.LPGFxFrontEnd_PlayerRecords." $ ShortPath) $ ">");
    //return ReturnValue;    
}

function OnAllWidgetsInit()
{
    InitScreen(!Class'Engine.WorldInfo'.static.IsConsoleBuild(0));
    SetHeaderText(GetLocalizedStringShort("StatHeader"));
    InitStatCategories();
    InitStatLabels();
    InitStatValues();
    //return;    
}

event FilterButtonInput()
{
    local /*0x97E50000-0x00000000*/ private int ControllerId[8388609];
    local /*0x97E50000-0x00000000*/ private name ButtonName[8388609];
    local /*0x97E50000-0x00000000*/ private byte InputEvent[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x2D
    if(super(SPGFxUIViewSettingsMenuBase).FilterButtonInput(ControllerId, ButtonName, InputEvent) == true)
    {
        return true;
    }
    // End:0x80
    if((ButtonName == 'XboxTypeS_B') || ButtonName == 'Escape')
    {
        // End:0x7B
        if(int(InputEvent) == int(0))
        {
            MoveBackImpl();
        }
        return true;        
    }
    else
    {
        // End:0x11F
        if((((((ButtonName == 'XboxTypeS_DPad_Left') || ButtonName == 'Left') || ButtonName == 'Gamepad_LeftStick_Left') || ButtonName == 'XboxTypeS_DPad_Right') || ButtonName == 'Right') || ButtonName == 'Gamepad_LeftStick_Right')
        {
            return bStatsReadInProgress;
        }
    }
    return true;
    //return ReturnValue;    
}

function SetUniqueNetId()
{
    local /*0x97E50000-0x00000000*/ private @NULL UniqueId[8388609];
    local /*0x97E50000-0x00000000*/ private bool bIsLocalPlayer, bIsNewPlayer;
    local /*0x97E50000-0x00000000*/ private @NULL CurrentUniqueId, LPPC;

    bIsNewPlayer = StatsPlayerIds.Length != 1;
    // End:0x7A
    if(!bIsNewPlayer)
    {
        CurrentUniqueId = StatsPlayerIds[0];
        bIsNewPlayer = !Class'Engine.OnlineSubsystem'.static.AreUniqueNetIdsEqual(UniqueId, CurrentUniqueId);
    }
    // End:0x192
    if(bIsNewPlayer)
    {
        StatsPlayerIds.Length = 1;
        StatsPlayerIds[0] = UniqueId;
        LPPC = LPPlayerController(MoviePlayer.GetPC());
        bIsLocalPlayer = Class'Engine.OnlineSubsystem'.static.AreUniqueNetIdsEqual(UniqueId, LPPC.PlayerReplicationInfo.UniqueId);
        StatManager = ((bIsLocalPlayer && bUseLocalStats) ? LPPC.GetStatManager() : none);
        InitStatValues();
    }
    UpdateStatDisplayInfo();
    //return;    
}

function UpdateListDataProvider()
{
    local /*0x97E50000-0x00000000*/ private int SelectedIndex[9437185];

    0
    //return;    
}

function InitStatCategories()
{
    local /*0x97E50000-0x00000000*/ private @NULL SC;

    // End:0x56
    foreach StatCategories(SC)
    {
        AddStatCategory(GetLocalizedStringShort("StatCat_" $ string(SC.CategoryName)));        
    }    
    //return;    
}

function InitStatLabels()
{
    local /*0x97E50000-0x00000000*/ private int Idx;

    Idx = 0;
    J0x0B:

    // End:0x88 [Loop If]
    if(Idx < StatDisplayInfo.Length)
    {
        StatDisplayInfo[Idx].DisplayString = GetStatDisplayString(StatDisplayInfo[Idx].DisplayName);
        Idx++;
        // [Loop Continue]
        goto J0x0B;
    }
    //return;    
}

function InitStatValues()
{
    local /*0x97E50000-0x00000000*/ private int Idx;

    SetStatCategory(0);
    bStatsReadSuccessful = false;
    bStatsReadInProgress = false;
    Idx = 0;
    J0x2E:

    // End:0x7D [Loop If]
    if(Idx < StatCategories.Length)
    {
        StatCategories[Idx].bStatsRead = false;
        Idx++;
        // [Loop Continue]
        goto J0x2E;
    }
    Idx = 0;
    J0x88:

    // End:0xF3 [Loop If]
    if(Idx < StatDisplayInfo.Length)
    {
        StatDisplayInfo[Idx].DisplayValue = GetStatValueString(StatDisplayInfo[Idx], true);
        Idx++;
        // [Loop Continue]
        goto J0x88;
    }
    //return;    
}

function UpdateStatDisplayInfo()
{
    // End:0x21F
    if((((StatManager == none) && !StatCategories[CurStatCategory].bStatsRead) && !bStatsReadInProgress) && StatsPlayerIds.Length > 0)
    {
        StatsReadGameType = StatCategories[CurStatCategory].GameType;
        switch(StatsReadGameType)
        {
            // End:0xC3
            case 0:
                StatsRead = new Class'LPReadGameplayStats_All';
                // End:0x154
                break;
            // End:0xE3
            case 3:
                StatsRead = new Class'LPReadGameplayStats_TDM';
                // End:0x154
                break;
            // End:0x103
            case 2:
                StatsRead = new Class'LPReadGameplayStats_Scenario';
                // End:0x154
                break;
            // End:0x123
            case 4:
                StatsRead = new Class'LPReadGameplayStats_Survival';
                // End:0x154
                break;
            // End:0x143
            case 1:
                StatsRead = new Class'LPReadGameplayStats_Extraction';
                // End:0x154
                break;
            // End:0xFFFF
            default:
                StatsRead = none;
                // End:0x154
                break;
                break;
        }
        bStatsReadSuccessful = false;
        // End:0x21F
        if(StatsRead != none)
        {
            bStatsReadInProgress = true;
            StatsInterface.AddReadOnlineStatsCompleteDelegate(ReadOnlineStatsComplete);
            StatsInterface.ReadOnlineStats(StatsPlayerIds, StatsRead);
            Outer.GetPC().SetTimer(3.0000000, false, 'CancelRead', self);            
        }
    }
    RepopulateStats();
    //return;    
}

function CancelRead()
{
    // End:0x21
    if(bStatsReadInProgress)
    {
        ReadOnlineStatsComplete(false);
    }
    //return;    
}

delegate ReadOnlineStatsComplete()
{
    local /*0x97E50000-0x00000000*/ private bool bWasSuccessful[8388609];
    local /*0x97E50000-0x00000000*/ private int Idx;

    StatsInterface.ClearReadOnlineStatsCompleteDelegate(ReadOnlineStatsComplete);
    bStatsReadSuccessful = bWasSuccessful;
    bStatsReadInProgress = false;
    // End:0xF1
    if(bWasSuccessful)
    {
        Idx = 0;
        J0x6A:

        // End:0xF1 [Loop If]
        if(Idx < StatCategories.Length)
        {
            // End:0xE3
            if(int(StatCategories[Idx].GameType) == int(StatsReadGameType))
            {
                StatCategories[Idx].bStatsRead = true;
            }
            Idx++;
            // [Loop Continue]
            goto J0x6A;
        }
    }
    EvaluateStats();
    RepopulateStats();
    //return;    
}

function GetStatDisplayString()
{
    local /*0x97E50000-0x00000000*/ private name StatName[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize string ReturnValue[92274689];

    return GetLocalizedString(("<Strings:LostPlanetGame.Stats." $ string(StatName)) $ ">");
    //return ReturnValue;    
}

function GetStatValueString()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL StatInfo[8388609];
    local /*0x97E50000-0x00000000*/ private bool bUseBlankValues[9437185];
    local /*0x97E50000-0x00000000*/ private editfixedsize string ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private float StatValue, StatValue2, Remainder;
    local /*0x97E50000-0x00000000*/ private editfixedsize string DisplayValue;
    local /*0x97E50000-0x00000000*/ private int Result, Current, Idx;
    local /*0x97E50000-0x00000000*/ private bool bUseOnlineValues, bUseLocalValues;

    false
    bUseLocalValues = StatManager != none;
    bUseOnlineValues = !bUseLocalValues && bStatsReadSuccessful;
    // End:0x76
    if((!bUseLocalValues && !bUseOnlineValues) && bUseBlankValues)
    {
        return "--";
    }
    switch(StatInfo.DisplayType)
    {
        // End:0x11C
        case 5:
            // End:0x11C
            if(bUseLocalValues)
            {
                StatValue = float(LPPlayerController(MoviePlayer.GetPC()).GetMetagameManager().GetMetagameRank());
                return string(int(StatValue));
            }
        // End:0x121
        case 0:
        // End:0x1E8
        case 1:
            // End:0x177
            if(bUseLocalValues)
            {
                return string(StatManager.EvalStat(StatInfo.StatNames[0]));                
            }
            else
            {
                // End:0x1E4
                if(bUseOnlineValues)
                {
                    StatsRead.GetIntStatValueForPlayer(StatsPlayerIds[0], StatInfo.StatColumns[0], Result);
                    return string(Result);                    
                }
                else
                {
                    return "0";
                }
            }
        // End:0x431
        case 4:
            // End:0x247
            if(bUseLocalValues)
            {
                StatValue = float(StatManager.EvalStat(StatInfo.StatNames[0]));                
            }
            else
            {
                // End:0x2BD
                if(bUseOnlineValues)
                {
                    StatsRead.GetIntStatValueForPlayer(StatsPlayerIds[0], StatInfo.StatColumns[0], Result);
                    StatValue = float(Result);                    
                }
                else
                {
                    StatValue = 0.0000000;
                }
            }
            DisplayValue = "";
            Remainder = StatValue;
            Current = int(Remainder / 3600.0000000);
            DisplayValue = (DisplayValue $ string(Current)) $ ":";
            Remainder = Remainder % float(3600);
            Current = int(Remainder / 60.0000000);
            // End:0x38C
            if(Current < 10)
            {
                DisplayValue = DisplayValue $ "0";
            }
            DisplayValue = (DisplayValue $ string(Current)) $ ":";
            Remainder = Remainder % float(60);
            Current = int(Remainder);
            // End:0x407
            if(Current < 10)
            {
                DisplayValue = DisplayValue $ "0";
            }
            DisplayValue = DisplayValue $ string(Current);
            return DisplayValue;
        // End:0x67D
        case 2:
            // End:0x52E
            if(bUseLocalValues)
            {
                StatValue = FMax(float(StatManager.EvalStat(StatInfo.StatNames[0])), 0.0000000);
                StatValue2 = FMax(float(StatManager.EvalStat(StatInfo.StatNames[1])), 1.0000000);
                StatValue = float(int((StatValue * 100.0000000) / StatValue2)) / 100.0000000;
                return FloatToString(StatValue, 2);                
            }
            else
            {
                // End:0x65E
                if(bUseOnlineValues)
                {
                    StatsRead.GetIntStatValueForPlayer(StatsPlayerIds[0], StatInfo.StatColumns[0], Result);
                    StatValue = FMax(float(Result), 0.0000000);
                    StatsRead.GetIntStatValueForPlayer(StatsPlayerIds[0], StatInfo.StatColumns[1], Result);
                    StatValue2 = FMax(float(Result), 1.0000000);
                    StatValue = float(int((StatValue * 100.0000000) / StatValue2)) / 100.0000000;
                    return FloatToString(StatValue, 2);                    
                }
                else
                {
                    return ("0" $ (GetLocalizedStringShort("Decimal"))) $ "00";
                }
            }
        // End:0x8D4
        case 3:
            // End:0x77F
            if(bUseLocalValues)
            {
                StatValue = FMax(float(StatManager.EvalStat(StatInfo.StatNames[0])), 0.0000000);
                StatValue2 = FMax(float(StatManager.EvalStat(StatInfo.StatNames[1])), 1.0000000);
                StatValue = float(int((StatValue * 1000.0000000) / StatValue2)) / 10.0000000;
                return (FloatToString(StatValue, 1)) $ " %";                
            }
            else
            {
                // End:0x8B4
                if(bUseOnlineValues)
                {
                    StatsRead.GetIntStatValueForPlayer(StatsPlayerIds[0], StatInfo.StatColumns[0], Result);
                    StatValue = FMax(float(Result), 0.0000000);
                    StatsRead.GetIntStatValueForPlayer(StatsPlayerIds[0], StatInfo.StatColumns[1], Result);
                    StatValue2 = FMax(float(Result), 1.0000000);
                    StatValue = float(int((StatValue * 1000.0000000) / StatValue2)) / 10.0000000;
                    return (FloatToString(StatValue, 1)) $ " %";                    
                }
                else
                {
                    return ("0" $ (GetLocalizedStringShort("Decimal"))) $ "0 %";
                }
            }
        // End:0xB13
        case 6:
            // End:0x9D8
            if(bUseLocalValues)
            {
                StatValue = float(StatManager.EvalStat(StatInfo.StatNames[0]));
                Idx = 1;
                J0x93B:

                // End:0x9C7 [Loop If]
                if(Idx < StatInfo.StatNames.Length)
                {
                    StatValue -= float(StatManager.EvalStat(StatInfo.StatNames[Idx]));
                    Idx++;
                    // [Loop Continue]
                    goto J0x93B;
                }
                return string(int(StatValue));                
            }
            else
            {
                // End:0xB0F
                if(bUseOnlineValues)
                {
                    StatsRead.GetIntStatValueForPlayer(StatsPlayerIds[0], StatInfo.StatColumns[0], Result);
                    StatValue = float(Result);
                    Idx = 1;
                    J0xA56:

                    // End:0xAFE [Loop If]
                    if(Idx < StatInfo.StatNames.Length)
                    {
                        StatsRead.GetIntStatValueForPlayer(StatsPlayerIds[0], StatInfo.StatColumns[Idx], Result);
                        StatValue -= float(Result);
                        Idx++;
                        // [Loop Continue]
                        goto J0xA56;
                    }
                    return string(int(StatValue));                    
                }
                else
                {
                    return "0";
                }
            }
        // End:0xD52
        case 7:
            // End:0xC17
            if(bUseLocalValues)
            {
                StatValue = float(StatManager.EvalStat(StatInfo.StatNames[0]));
                Idx = 1;
                J0xB7A:

                // End:0xC06 [Loop If]
                if(Idx < StatInfo.StatNames.Length)
                {
                    StatValue += float(StatManager.EvalStat(StatInfo.StatNames[Idx]));
                    Idx++;
                    // [Loop Continue]
                    goto J0xB7A;
                }
                return string(int(StatValue));                
            }
            else
            {
                // End:0xD4E
                if(bUseOnlineValues)
                {
                    StatsRead.GetIntStatValueForPlayer(StatsPlayerIds[0], StatInfo.StatColumns[0], Result);
                    StatValue = float(Result);
                    Idx = 1;
                    J0xC95:

                    // End:0xD3D [Loop If]
                    if(Idx < StatInfo.StatNames.Length)
                    {
                        StatsRead.GetIntStatValueForPlayer(StatsPlayerIds[0], StatInfo.StatColumns[Idx], Result);
                        StatValue += float(Result);
                        Idx++;
                        // [Loop Continue]
                        goto J0xC95;
                    }
                    return string(int(StatValue));                    
                }
                else
                {
                    return "0";
                }
            }
        // End:0xFFFF
        default:
            //return ReturnValue;
            break;
    }    
}

function EvaluateStats()
{
    local /*0x97E50000-0x00000000*/ private int Idx;

    Idx = 0;
    J0x0B:

    // End:0xBF [Loop If]
    if(Idx < StatDisplayInfo.Length)
    {
        // End:0xB1
        if((StatManager != none) || int(StatDisplayInfo[Idx].GameType) == int(StatsReadGameType))
        {
            StatDisplayInfo[Idx].DisplayValue = GetStatValueString(StatDisplayInfo[Idx]);
        }
        Idx++;
        // [Loop Continue]
        goto J0x0B;
    }    
    StatDisplayInfo.Sort(StatSort_LineNum);    
    //return;    
}

function RepopulateStats()
{
    local /*0x97E50000-0x00000000*/ private int Idx, displayIdx;

    displayIdx = 0;
    Idx = 0;
    J0x16:

    // End:0x70 [Loop If]
    if(Idx < StatDisplayInfo.Length)
    {
        // End:0x62
        if(StatFilter_Category(StatDisplayInfo[Idx]))
        {
            displayIdx++;
        }
        Idx++;
        // [Loop Continue]
        goto J0x16;
    }
    SetStatCount(displayIdx);
    displayIdx = 0;
    Idx = 0;
    J0x99:

    // End:0x180 [Loop If]
    if(Idx < StatDisplayInfo.Length)
    {
        // End:0x172
        if(StatFilter_Category(StatDisplayInfo[Idx]))
        {
            SetStatEntry(displayIdx, StatDisplayInfo[Idx].DisplayString, StatDisplayInfo[Idx].DisplayValue, int(StatDisplayInfo[Idx].DisplayType) == int(1));
            displayIdx++;
        }
        Idx++;
        // [Loop Continue]
        goto J0x99;
    }
    //return;    
}

function OnStatCategoryChange()
{
    local /*0x97E50000-0x00000000*/ private int StatCategoryIdx[8388609];

    CurStatCategory = StatCategoryIdx;
    UpdateStatDisplayInfo();
    Outer.PlaySoundFromTheme('RecordsHorizontal');
    //return;    
}

delegate StatFilter_Category()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL A[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return A.DisplayCategory == StatCategories[CurStatCategory].CategoryName;
    //return ReturnValue;    
}

delegate StatSort_LineNum()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL A[8388609], B;
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];

    return ((A.LineNumber > B.LineNumber) ? -1 : 0);
    //return ReturnValue;    
}

function FloatToString()
{
    local /*0x97E50000-0x00000000*/ private float N[8388609];
    local /*0x97E50000-0x00000000*/ private int Precision[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize string ReturnValue[92274689], Result;
    local /*0x97E50000-0x00000000*/ private int DecimalIdx, NewLength;

    Result = string(N);
    DecimalIdx = InStr(Result, ".");
    // End:0xBC
    if(DecimalIdx >= 0)
    {
        NewLength = DecimalIdx + ((Precision == 0) ? 0 : Precision + 1);
        Result = Repl(Result, ".", GetLocalizedStringShort("Decimal"));
        Result = Left(Result, NewLength);
    }
    return Result;
    //return ReturnValue;    
}

function InitScreen()
{
    local /*0x97E50000-0x00000000*/ private bool bIsPC[8388609];

    ActionScriptVoid("initScreen");
    //return;    
}

function SetHeaderText()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string Header[8388609];

    ActionScriptVoid("setStatisticsHeaderText");
    //return;    
}

function SetStatCount()
{
    local /*0x97E50000-0x00000000*/ private int NumStats[8388609];

    ActionScriptVoid("setNumStatistics");
    //return;    
}

function AddStatCategory()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string CategoryName[8388609];

    ActionScriptVoid("addStatisticsCategory");
    //return;    
}

function SetStatCategory()
{
    local /*0x97E50000-0x00000000*/ private int Idx[8388609];

    // End:0x5D
    if((Idx >= 0) && Idx < StatCategories.Length)
    {
        CurStatCategory = Idx;
        ActionScriptVoid("setStatisticsCategory");
    }
    //return;    
}

function SetStatEntry()
{
    local /*0x97E50000-0x00000000*/ private int Idx[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize string StatName[8388609], StatVal;
    local /*0x97E50000-0x00000000*/ private bool bStatIsCredits[8388609];

    ActionScriptVoid("updateStatisticsData");
    //return;    
}

defaultproperties
{
    bUseLocalStats=true
    StatCategories=/* Array type was not detected. */
    StatDisplayInfo=/* Array type was not detected. */
    ListChangeSoundEventNameMP="None"
    bShouldHideViewStack=false
    SubWidgetBindings=/* Array type was not detected. */
}