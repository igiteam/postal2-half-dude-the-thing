class LPGFxFrontEnd_Awards extends LPGFxFrontEnd_Screen within GFxMoviePlayer
    config(UI);

const TotalWidgetCount = 15;

enum eRecordsAwardsSort
{
    RAS_Type,                       // 0
    RAS_Name,                       // 1
    RAS_Desc,                       // 2
    RAS_Earned,                     // 3
    RAS_Credits,                    // 4
    RAS_MAX                         // 5
};

enum eRecordsAwardsFilter
{
    RAF_All,                        // 0
    RAF_Aggression,                 // 1
    RAF_Support,                    // 2
    RAF_Consolation,                // 3
    RAF_NonSequitur,                // 4
    RAF_Commendations,              // 5
    RAF_MAX                         // 6
};

struct GameAwardStruct
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL Award;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private int AwardedNum;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private int AwardedCredits;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string LocalizedName;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string LocalizedDesc;

    structdefaultproperties
    {
        Award=none
        AwardedNum=0
        AwardedCredits=0
        LocalizedName=""
        LocalizedDesc=""
    }
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

var(0.25_Pct) /*0x97E50000-0x00000000*/ private int WidgetCount[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bAllWidgetsInit[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bDataInit[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bReverseAwardSort[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte AwardSortType[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte AwardFilterType[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array GameAwards[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array WidgetList;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL SortLabel;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL PageLabel;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL BackLabel;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL SelectLabel;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL DetailsLabel;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL GamerCardLabel;
//var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> __AwardFilter__Delegate;
//var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> __AwardSort__Delegate;
//var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> __AwardFilter_Aggression__Delegate;
//var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> __AwardFilter_Support__Delegate;
//var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> __AwardFilter_Consolation__Delegate;
//var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> __AwardFilter_NonSequitur__Delegate;
//var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> __AwardFilter_Commendation__Delegate;
//var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> __AwardSort_Type__Delegate;
//var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> __AwardSort_Name__Delegate;
//var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> __AwardSort_Desc__Delegate;
//var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> __AwardSort_Earned__Delegate;
//var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> __AwardSort_Credits__Delegate;

delegate AwardFilter()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL A[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

delegate AwardSort()
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
    focusObj = GetObject("awardsContainer").GetObject("awardsList");
    MenuViewLoader.SetSelectionFocus(focusObj);
    MoviePlayer.SetExternalInterface(self);
    SetUpButtonLegend();
    InitData();
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
    if(WidgetName == 'awardsList')
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
    if(WidgetCount == 15)
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
    InitAwardsTab();
    InitScreen(!Class'Engine.WorldInfo'.static.IsConsoleBuild(0));
    SetHeaderText(GetLocalizedStringShort("AwardsHeader"));
    //return;    
}

function InitData()
{
    // End:0x19
    if(!bDataInit)
    {
        InitAwardsData();
    }
    bDataInit = true;
    //return;    
}

function UpdateSortArrow()
{
    SetSortArrow(int(AwardSortType), bReverseAwardSort);
    //return;    
}

event FilterButtonInput()
{
    local /*0x97E50000-0x00000000*/ private int ControllerId[8388609];
    local /*0x97E50000-0x00000000*/ private name ButtonName[8388609];
    local /*0x97E50000-0x00000000*/ private byte InputEvent[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], bResult;

    // End:0x2D
    if(super(SPGFxUIViewSettingsMenuBase).FilterButtonInput(ControllerId, ButtonName, InputEvent) == true)
    {
        return true;
    }
    bResult = false;
    // End:0x93
    if((ButtonName == 'XboxTypeS_B') || ButtonName == 'Escape')
    {
        // End:0x87
        if(int(InputEvent) == int(0))
        {
            MoveBackImpl();
        }
        bResult = true;
    }
    // End:0xED
    if((ButtonName == 'XboxTypeS_Y') || ButtonName == 'Two')
    {
        // End:0xE1
        if(int(InputEvent) == int(0))
        {
            IncrementAwardSort();
        }
        bResult = true;
    }
    return bResult;
    //return ReturnValue;    
}

function InitAwardsTab()
{
    SetAwardsHeaderText(GetLocalizedStringShort("AwardsColType"), GetLocalizedStringShort("AwardsColName"), GetLocalizedStringShort("AwardsColDesc"), GetLocalizedStringShort("AwardsColCount"), GetLocalizedStringShort("AwardsColValue"));
    AddAwardsCategory(GetLocalizedStringShort("AwardsCat1"));
    AddAwardsCategory(GetLocalizedStringShort("AwardsCat2"));
    AddAwardsCategory(GetLocalizedStringShort("AwardsCat3"));
    AddAwardsCategory(GetLocalizedStringShort("AwardsCat4"));
    AddAwardsCategory(GetLocalizedStringShort("AwardsCat5"));
    AddAwardsCategory(GetLocalizedStringShort("AwardsCat6"));
    UpdateSortArrow();
    //return;    
}

function InitAwardsData()
{
    InitAwards();
    RepopulateAwards();
    //return;    
}

function AddAwardEntry()
{
    local /*0x97E50000-0x00000000*/ private @NULL Award[8388609], GAS, Commendation, Emblem;

    GAS.Award = Award;
    GAS.LocalizedName = Award.GetAwardString();
    GAS.LocalizedDesc = Award.GetPrerequisiteString();
    Emblem = LPEmblem(Award);
    // End:0x172
    if(Emblem != none)
    {
        GAS.AwardedNum = Emblem.GetTimesAwardedStat().Evaluate();
        GAS.AwardedCredits = Emblem.GetTotalCreditsStat().Evaluate();        
    }
    else
    {
        Commendation = LPCommendation(Award);
        // End:0x243
        if(Commendation != none)
        {
            GAS.AwardedNum = Commendation.GetTimesAwardedStat().Evaluate();
            GAS.AwardedCredits = Commendation.GetTotalCreditsStat().Evaluate();
        }
    }
    GameAwards.AddItem(GAS);    
    //return;    
}

function InitAwards()
{
    local /*0x97E50000-0x00000000*/ private @NULL AwardManager, Award;

    AwardManager = LPPlayerController(Outer.GetPC()).GetAwardManager();
    // End:0x98
    if(AwardManager != none)
    {
        // End:0x97
        foreach AwardManager.Awards(Award)
        {
            AddAwardEntry(Award);            
        }        
    }
    //return;    
}

function PopulateAwards()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> AwFilter[9437185], AwSort;
    local /*0x97E50000-0x00000000*/ private int Idx, displayIdx;
    local /*0x97E50000-0x00000000*/ private editfixedsize string LocalizedDesc;
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL GAS;

    // End:0x30
    if(AwSort != none)
    {        
        GameAwards.Sort(AwSort);        
    }
    // End:0xC5
    if(AwFilter != none)
    {
        displayIdx = 0;
        Idx = 0;
        J0x55:

        // End:0xAF [Loop If]
        if(Idx < GameAwards.Length)
        {
            // End:0xA1
            if(AwardFilter(GameAwards[Idx]))
            {
                displayIdx++;
            }
            Idx++;
            // [Loop Continue]
            goto J0x55;
        }
        SetAwardsCount(displayIdx);        
    }
    else
    {
        SetAwardsCount(GameAwards.Length);
    }
    displayIdx = 0;
    Idx = 0;
    J0xEF:

    // End:0x34A [Loop If]
    if(Idx < GameAwards.Length)
    {
        GAS = ((bReverseAwardSort) ? GameAwards[(GameAwards.Length - Idx) - 1] : GameAwards[Idx]);
        // End:0x33C
        if(AwFilter == none || AwardFilter(GAS))
        {
            LocalizedDesc = GetLocalizedString(GAS.Award.GetPrerequisiteString());
            LocalizedDesc = Repl(LocalizedDesc, "<num>", string(GAS.Award.GetRequiredCount()));
            LocalizedDesc = Repl(LocalizedDesc, "<req>", string(int(GAS.Award.GetRequirementParam())));
            SetAwardEntry(displayIdx, GAS.Award.GetAwardTypeIconName(), GetLocalizedString(GAS.Award.GetAwardString()), LocalizedDesc, GAS.AwardedNum, GAS.AwardedCredits);
            displayIdx++;
        }
        Idx++;
        // [Loop Continue]
        goto J0xEF;
    }
    //return;    
}

function RepopulateAwards()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> AwFilter, AwSort;

    switch(AwardSortType)
    {
        // End:0x36
        case 1:
            AwSort = AwardSort_Name;
            // End:0xC5
            break;
        // End:0x59
        case 2:
            AwSort = AwardSort_Desc;
            // End:0xC5
            break;
        // End:0x7C
        case 3:
            AwSort = AwardSort_Earned;
            // End:0xC5
            break;
        // End:0x9F
        case 4:
            AwSort = AwardSort_Credits;
            // End:0xC5
            break;
        // End:0xC2
        case 0:
            AwSort = AwardSort_Type;
            // End:0xC5
            break;
        // End:0xFFFF
        default:
            break;
    }
    switch(AwardFilterType)
    {
        // End:0xFB
        case 0:
            AwFilter = None;
            // End:0x1AD
            break;
        // End:0x11E
        case 1:
            AwFilter = AwardFilter_Aggression;
            // End:0x1AD
            break;
        // End:0x141
        case 2:
            AwFilter = AwardFilter_Support;
            // End:0x1AD
            break;
        // End:0x164
        case 3:
            AwFilter = AwardFilter_Consolation;
            // End:0x1AD
            break;
        // End:0x187
        case 4:
            AwFilter = AwardFilter_NonSequitur;
            // End:0x1AD
            break;
        // End:0x1AA
        case 5:
            AwFilter = AwardFilter_Commendation;
            // End:0x1AD
            break;
        // End:0xFFFF
        default:
            break;
    }
    PopulateAwards(AwFilter, AwSort);
    //return;    
}

function OnAwardsCategoryChange()
{
    local /*0x97E50000-0x00000000*/ private int AwardFilterTypeIdx[8388609];

    SuppressDefaultSoundEvents(true);
    AwardFilterType = byte(AwardFilterTypeIdx);
    Outer.PlaySoundFromTheme('RecordsHorizontal');
    RepopulateAwards();
    SuppressDefaultSoundEvents(false);
    //return;    
}

function IncrementAwardSort()
{
    Outer.PlaySoundFromTheme('RecordsFocusPlayerSort');
    // End:0x77
    if(bReverseAwardSort)
    {
        // End:0x5D
        if((int(AwardSortType) + int(1)) > 4)
        {
            AwardSortType = 0;            
        }
        else
        {
            AwardSortType = byte(int(AwardSortType) + 1);
        }
    }
    bReverseAwardSort = !bReverseAwardSort;
    RepopulateAwards();
    UpdateSortArrow();
    //return;    
}

function DisableSubComponents()
{
    local /*0x97E50000-0x00000000*/ private bool bDisableComponents[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL WI;

    // End:0x118
    foreach WidgetList(WI)
    {
        // End:0xBE
        if(bDisableComponents)
        {
            WI.bCurrentState = WI.Widget.GetBool("disabled");
            WI.Widget.SetBool("disabled", true);            
        }
        else
        {
            WI.Widget.SetBool("disabled", WI.bCurrentState);
        }        
    }    
    super.DisableSubComponents(bDisableComponents);
    //return;    
}

function AwardsSort()
{
    local /*0x97E50000-0x00000000*/ private int Category[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize string Order[8388609];

    Outer.PlaySoundFromTheme('RecordsFocusPlayerSort');
    // End:0x60
    if(int(AwardSortType) == int(byte(Category)))
    {
        bReverseAwardSort = !bReverseAwardSort;        
    }
    else
    {
        AwardSortType = byte(Category);
    }
    RepopulateAwards();
    UpdateSortArrow();
    //return;    
}

delegate AwardFilter_Aggression()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL A[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return LPEmblem_Aggression(A.Award) != none;
    //return ReturnValue;    
}

delegate AwardFilter_Support()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL A[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return LPEmblem_Support(A.Award) != none;
    //return ReturnValue;    
}

delegate AwardFilter_Consolation()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL A[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return LPEmblem_Consolation(A.Award) != none;
    //return ReturnValue;    
}

delegate AwardFilter_NonSequitur()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL A[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return LPEmblem_NonSequitur(A.Award) != none;
    //return ReturnValue;    
}

delegate AwardFilter_Commendation()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL A[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return LPCommendation(A.Award) != none;
    //return ReturnValue;    
}

delegate AwardSort_Type()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL A[8388609], B;
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689], TypeRankA, TypeRankB;

    TypeRankA = GetTypeRanking(A);
    TypeRankB = GetTypeRanking(B);
    return ((TypeRankA > TypeRankB) ? -1 : 0);
    //return ReturnValue;    
}

delegate AwardSort_Name()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL A[8388609], B;
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];

    return ((A.LocalizedName > B.LocalizedName) ? -1 : 0);
    //return ReturnValue;    
}

delegate AwardSort_Desc()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL A[8388609], B;
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];

    return ((A.LocalizedDesc > B.LocalizedDesc) ? -1 : 0);
    //return ReturnValue;    
}

delegate AwardSort_Earned()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL A[8388609], B;
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];

    // End:0x63
    if(A.AwardedNum == B.AwardedNum)
    {
        return AwardSort_Type(A, B);
    }
    return ((A.AwardedNum < B.AwardedNum) ? -1 : 0);
    //return ReturnValue;    
}

delegate AwardSort_Credits()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL A[8388609], B;
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];

    // End:0x63
    if(A.AwardedCredits == B.AwardedCredits)
    {
        return AwardSort_Type(A, B);
    }
    return ((A.AwardedCredits < B.AwardedCredits) ? -1 : 0);
    //return ReturnValue;    
}

function GetTypeRanking()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL A[8388609];
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private class AwardClass;

    AwardClass = A.Award.Class;
    // End:0x58
    if(ClassIsChildOf(AwardClass, Class'LPEmblem_Aggression'))
    {
        return 0;        
    }
    else
    {
        // End:0x75
        if(ClassIsChildOf(AwardClass, Class'LPEmblem_Support'))
        {
            return 1;            
        }
        else
        {
            // End:0x93
            if(ClassIsChildOf(AwardClass, Class'LPEmblem_Consolation'))
            {
                return 2;                
            }
            else
            {
                // End:0xB1
                if(ClassIsChildOf(AwardClass, Class'LPEmblem_NonSequitur'))
                {
                    return 3;                    
                }
                else
                {
                    // End:0xCC
                    if(ClassIsChildOf(AwardClass, Class'LPCommendation'))
                    {
                        return 4;
                    }
                }
            }
        }
    }
    return 2147483647;
    //return ReturnValue;    
}

function UpdateListDataProvider()
{
    local /*0x97E50000-0x00000000*/ private int SelectedIndex[9437185];

    0
    //return;    
}

function DisableAllItemRenderers()
{
    local /*0x97E50000-0x00000000*/ private bool bDisable[8388609];

    //return;    
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

    ActionScriptVoid("setAwardsHeaderText");
    //return;    
}

function SetSortArrow()
{
    local /*0x97E50000-0x00000000*/ private int ColIdx[8388609];
    local /*0x97E50000-0x00000000*/ private bool bReverse[8388609];

    ActionScriptVoid("setSortArrowEx");
    //return;    
}

function SetAwardsHeaderText()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string Type[8388609], AwardName, AwardDesc, AwardCount, AwardValue;

    ActionScriptVoid("setAwardsTableHeaderText");
    //return;    
}

function SetAwardsCount()
{
    local /*0x97E50000-0x00000000*/ private int NumAwards[8388609];

    ActionScriptVoid("setNumAwards");
    //return;    
}

function AddAwardsCategory()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string CategoryName[8388609];

    ActionScriptVoid("addAwardsCategory");
    //return;    
}

function SetAwardEntry()
{
    local /*0x97E50000-0x00000000*/ private int Idx[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize string AwardIcon[8388609], AwardName, AwardDesc;
    local /*0x97E50000-0x00000000*/ private int AwardCount[8388609], AwardValue;

    ActionScriptVoid("updateAwardData");
    //return;    
}

defaultproperties
{
    ListChangeSoundEventNameMP="RecordsVertical"
    bShouldHideViewStack=false
    SubWidgetBindings=/* Array type was not detected. */
}