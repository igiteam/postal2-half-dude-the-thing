class LPGFxFrontEnd_MatchSummary extends LPGFxFrontEnd_Screen within GFxMoviePlayer
    config(UI);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ContextMenu;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MatchDataStore[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bJumpToScoreboard[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bContextMenuOpen[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bAllWidgetsInit[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int WidgetCount[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int SelectedTeamIndex[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int SelectedPlayerIndex[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int SelectedTabIndex[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array MatchDataIndicesTeam0;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array MatchDataIndicesTeam1;
//var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> __CompareScoresByCredits__Delegate;
//var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> __CompareScoresByKills__Delegate;
//var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> __OnContextMenuVisible__Delegate;

function OnTopMostView()
{
    local /*0x97E50000-0x00000000*/ private bool bPlayOpenAnimation[9437185];
    local /*0x97E50000-0x00000000*/ private name previousView[9437185];

    false
    'None'
    LPGFxMoviePlayerFrontEndManager(MoviePlayer).SuspendRendering();
    super.OnTopMostView(bPlayOpenAnimation, previousView);
    MoviePlayer.SetExternalInterface(self);
    InitializeData();
    ForceRefreshFocus(0);
    LPGFxMoviePlayerFrontEndManager(MoviePlayer).ResumeRendering();
    //return;    
}

function InitializeData()
{
    local /*0x97E50000-0x00000000*/ private @NULL DataStoreManager;

    // End:0xA8
    if(MatchDataStore == none)
    {
        DataStoreManager = Class'Engine.UIInteraction'.static.GetDataStoreClient();
        // End:0x98
        if(DataStoreManager != none)
        {
            MatchDataStore = LPUIDataStore_MatchSummary(Class'Engine.UIRoot'.static.StaticResolveDataStore(Class'LPUIDataStore_MatchSummary'.default.Tag));
        }
        // DebugMode: 0
        assert(MatchDataStore != none);
    }
    MatchDataStore.bMatchDataNeedsShowing = false;
    // End:0xDA
    if(!bAllWidgetsInit)
    {
        return;
    }
    Populate();
    //return;    
}

function SetUpFakeData()
{
    local /*0x97E50000-0x00000000*/ private @NULL Uid;

    MatchDataStore.bMatchDataAvailable = true;
    MatchDataStore.bMatchWonByNevec = false;
    MatchDataStore.MatchRounds = 3;
    MatchDataStore.MatchTimeInSeconds = 689;
    MatchDataStore.MatchBonusCredits = 2500;
    MatchDataStore.AddScoreEntry(Uid, "Nevec0", 23, 0, 1, 2, 3, 4, 530, false);
    MatchDataStore.AddScoreEntry(Uid, "Nevec1", 14, 0, 5, 4, 3, 4, 890, false);
    MatchDataStore.AddScoreEntry(Uid, "Nevec2", 42, 0, 10, 23, 3, 14, 1200, false);
    MatchDataStore.AddScoreEntry(Uid, "Nevec3", 8, 0, 13, 5, 7, 9, 1000, false);
    MatchDataStore.AddScoreEntry(Uid, "Nevec4", 19, 0, 12, 15, 3, 3, 670, false);
    MatchDataStore.AddScoreEntry(Uid, "Pirate0", 3, 1, 1, 2, 3, 4, 530, false);
    MatchDataStore.AddScoreEntry(Uid, "Pirate1", 35, 1, 5, 4, 3, 4, 890, false);
    MatchDataStore.AddScoreEntry(Uid, "Pirate2", 28, 1, 10, 23, 3, 14, 1200, true);
    MatchDataStore.AddScoreEntry(Uid, "Pirate3", 37, 1, 13, 5, 7, 9, 1000, false);
    MatchDataStore.AddScoreEntry(Uid, "Pirate4", 12, 1, 12, 15, 3, 3, 670, false);
    //return;    
}

function Populate()
{
    local /*0x97E50000-0x00000000*/ private int Idx, ListIdx;
    local /*0x97E50000-0x00000000*/ private @NULL MAS, MSS;
    local /*0x97E50000-0x00000000*/ private bool bInvertTeamNum, bIsNevec;
    local /*0x97E50000-0x00000000*/ private int CurNevecIdx, CurPirateIdx, TeamIdx;
    local /*0x97E50000-0x00000000*/ private editfixedsize string LocalizedDesc;
    local /*0x97E50000-0x00000000*/ private @NULL AwardMgr, Award;

    SetAwardsCount(MatchDataStore.MatchAwards.Length);
    AwardMgr = LPPlayerController(MoviePlayer.GetPC()).GetAwardManager();
    ListIdx = 0;
    Idx = 0;
    J0x87:

    // End:0x295 [Loop If]
    if(Idx < MatchDataStore.MatchAwards.Length)
    {
        MAS = MatchDataStore.MatchAwards[Idx];
        Award = AwardMgr.GetAward(MAS.AwardName);
        // End:0x287
        if(LPEmblem(Award) != none)
        {
            LocalizedDesc = Award.GetPrerequisiteString();
            LocalizedDesc = Repl(LocalizedDesc, "<num>", string(Award.GetRequiredCount()));
            LocalizedDesc = Repl(LocalizedDesc, "<req>", string(int(Award.GetRequirementParam())));
            SetAwardData(ListIdx, Award.GetAwardTypeIconName(), Award.GetAwardString(), LocalizedDesc, MAS.AwardedNum, MAS.AwardedCredits);
            ListIdx++;
        }
        Idx++;
        // [Loop Continue]
        goto J0x87;
    }
    Idx = 0;
    J0x2A0:

    // End:0x4AE [Loop If]
    if(Idx < MatchDataStore.MatchAwards.Length)
    {
        MAS = MatchDataStore.MatchAwards[Idx];
        Award = AwardMgr.GetAward(MAS.AwardName);
        // End:0x4A0
        if(LPCommendation(Award) != none)
        {
            LocalizedDesc = Award.GetPrerequisiteString();
            LocalizedDesc = Repl(LocalizedDesc, "<num>", string(Award.GetRequiredCount()));
            LocalizedDesc = Repl(LocalizedDesc, "<req>", string(int(Award.GetRequirementParam())));
            SetAwardData(ListIdx, Award.GetAwardTypeIconName(), Award.GetAwardString(), LocalizedDesc, MAS.AwardedNum, MAS.AwardedCredits);
            ListIdx++;
        }
        Idx++;
        // [Loop Continue]
        goto J0x2A0;
    }
    SetAwardsCredits(MatchDataStore.MatchBonusCredits, MatchDataStore.GetCreditsAwarded());
    bInvertTeamNum = !MatchDataStore.bMatchWonByNevec;
    SetWinningTeam(MatchDataStore.bMatchWonByNevec);
    // End:0x60D
    if(MatchDataStore.bMatchWonByNevec)
    {
        SetTeamHeaders(GetLocalizedString("<Strings:LostPlanetGame.LPGFxFrontEnd_MatchSummary.TeamNevec>"), GetLocalizedString("<Strings:LostPlanetGame.LPGFxFrontEnd_MatchSummary.TeamPirates>"));        
    }
    else
    {
        SetTeamHeaders(GetLocalizedString("<Strings:LostPlanetGame.LPGFxFrontEnd_MatchSummary.TeamPirates>"), GetLocalizedString("<Strings:LostPlanetGame.LPGFxFrontEnd_MatchSummary.TeamNevec>"));
    }
    SetMatchInfo(MatchDataStore.MatchRounds, MatchDataStore.MatchTimeInSeconds);
    CurNevecIdx = 0;
    CurPirateIdx = 0;
    // End:0x76F
    if(int(MatchDataStore.MatchGameType) == int(3))
    {        
        MatchDataStore.MatchScores.Sort(CompareScoresByKills);                
    }
    else
    {        
        MatchDataStore.MatchScores.Sort(CompareScoresByCredits);        
    }
    Idx = 0;
    J0x7B6:

    // End:0x85E [Loop If]
    if(Idx < MatchDataStore.MatchScores.Length)
    {
        MSS = MatchDataStore.MatchScores[Idx];
        // End:0x845
        if(MSS.TeamNum == 0)
        {
            CurNevecIdx++;            
        }
        else
        {
            CurPirateIdx++;
        }
        Idx++;
        // [Loop Continue]
        goto J0x7B6;
    }
    SetNumPlayers(((bInvertTeamNum) ? CurPirateIdx : CurNevecIdx), ((bInvertTeamNum) ? CurNevecIdx : CurPirateIdx));
    MatchDataIndicesTeam0.Length = ((bInvertTeamNum) ? CurPirateIdx : CurNevecIdx);
    MatchDataIndicesTeam1.Length = ((bInvertTeamNum) ? CurNevecIdx : CurPirateIdx);
    CurNevecIdx = 0;
    CurPirateIdx = 0;
    Idx = 0;
    J0x923:

    // End:0xC1E [Loop If]
    if(Idx < MatchDataStore.MatchScores.Length)
    {
        MSS = MatchDataStore.MatchScores[Idx];
        bIsNevec = MSS.TeamNum == 0;
        TeamIdx = ((bInvertTeamNum) ? 1 - MSS.TeamNum : MSS.TeamNum);
        SetScoreData(TeamIdx, ((bIsNevec) ? CurNevecIdx : CurPirateIdx), MSS.PlayerTag, MSS.PlayerRank, float(MSS.Kills), float(MSS.Deaths), GetKDRatio(MSS.Kills, MSS.Deaths), float(MSS.Assists), float(MSS.Revives), MSS.Credits, MSS.bLocalPlayer);
        // End:0xBA6
        if(TeamIdx == 0)
        {
            MatchDataIndicesTeam0[((bIsNevec) ? CurNevecIdx : CurPirateIdx)] = Idx;            
        }
        else
        {
            // End:0xBEA
            if(TeamIdx == 1)
            {
                MatchDataIndicesTeam1[((bIsNevec) ? CurNevecIdx : CurPirateIdx)] = Idx;
            }
        }
        // End:0xC05
        if(bIsNevec)
        {
            CurNevecIdx++;            
        }
        else
        {
            CurPirateIdx++;
        }
        Idx++;
        // [Loop Continue]
        goto J0x923;
    }
    Idx = 0;
    J0xC29:

    // End:0xD7D [Loop If]
    if(Idx < 2)
    {
        MSS = MatchDataStore.GetTeamTotals(Idx);
        SetTeamScoreData(((bInvertTeamNum) ? 1 - Idx : Idx), float(MSS.Kills), float(MSS.Deaths), GetKDRatio(MSS.Kills, MSS.Deaths), float(MSS.Assists), float(MSS.Revives), MSS.Credits);
        Idx++;
        // [Loop Continue]
        goto J0xC29;
    }
    //return;    
}

delegate CompareScoresByCredits()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL A[8388609], B;
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];

    return ((A.Credits < B.Credits) ? -1 : 0);
    //return ReturnValue;    
}

delegate CompareScoresByKills()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL A[8388609], B;
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];

    return ((A.Kills < B.Kills) ? -1 : (((A.Kills == B.Kills) && A.Credits < B.Credits) ? -1 : 0));
    //return ReturnValue;    
}

function GetKDRatio()
{
    local /*0x97E50000-0x00000000*/ private int Kills[8388609], Deaths;
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689], Result;

    Result = float(Kills);
    // End:0x7C
    if(Deaths > 0)
    {
        Result = float(Kills) / float(Deaths);
        Result *= float(100);
        Result = float(Round(Result));
        Result *= 0.0100000;
    }
    return Result;
    //return ReturnValue;    
}

event WidgetInitialized()
{
    local /*0x97E50000-0x00000000*/ private name WidgetName[8388609], WidgetPath;
    local /*0x97E50000-0x00000000*/ private @NULL Widget[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private editfixedsize string LocalizedString;
    local /*0x97E50000-0x00000000*/ private bool bResult;

    bResult = super.WidgetInitialized(WidgetName, WidgetPath, Widget);
    WidgetCount++;
    LocalizedString = GetLocalizedString(("<Strings:LostPlanetGame.LPGFxFrontEnd_MatchSummary.Widget_" $ string(WidgetName)) $ ">");
    // End:0xE8
    if(IsLocalizationSuccessful(LocalizedString))
    {
        Widget.SetText(LocalizedString);
        bResult = true;
    }
    switch(WidgetName)
    {
        // End:0x1EA
        case 'TabName':
            LocalizedString = GetLocalizedString("<Strings:LostPlanetGame.LPGFxFrontEnd_MatchSummary.TabAward>");
            SetScoreboardHeader(GetLocalizedString("<Strings:LostPlanetGame.LPGFxFrontEnd_MatchSummary.TabScore>"));
            SetAwardsHeader(LocalizedString);
            Widget.SetText(LocalizedString);
            // End:0x23B
            break;
        // End:0x238
        case 'awardsList':
            // End:0x235
            if(ListMC == none)
            {
                ListMC = GFxClikWidget(Widget);
                SetList(ListMC);
            }
            // End:0x23B
            break;
        // End:0xFFFF
        default:
            break;
    }
    // End:0x26E
    if(WidgetCount == 57)
    {
        bAllWidgetsInit = true;
        // End:0x26E
        if(bIsTopView)
        {
            Populate();
        }
    }
    return bResult;
    //return ReturnValue;    
}

event FilterButtonInput()
{
    local /*0x97E50000-0x00000000*/ private int ControllerId[8388609];
    local /*0x97E50000-0x00000000*/ private name ButtonName[8388609];
    local /*0x97E50000-0x00000000*/ private byte InputEvent[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    ForceRefreshFocus();
    // End:0x38
    if(super(SPGFxUIViewSettingsMenuBase).FilterButtonInput(ControllerId, ButtonName, InputEvent) == true)
    {
        return true;
    }
    // End:0x2BF
    if(int(InputEvent) == int(0))
    {
        // End:0x6F
        if(ButtonName == 'XboxTypeS_B')
        {
            BackPressed();
            return true;
        }
        // End:0xEE
        if((ButtonName == 'XboxTypeS_LeftShoulder') || ButtonName == 'Three')
        {
            SetAwardsTab();
            // End:0xEC
            if(SelectedTabIndex != 0)
            {
                Outer.PlaySoundFromTheme('PostMatchBumper');
                SelectedTabIndex = 0;
            }
            return true;
        }
        // End:0x16D
        if((ButtonName == 'XboxTypeS_RightShoulder') || ButtonName == 'Four')
        {
            SetScoreboardTab();
            // End:0x16B
            if(SelectedTabIndex != 1)
            {
                Outer.PlaySoundFromTheme('PostMatchBumper');
                SelectedTabIndex = 1;
            }
            return true;
        }
        // End:0x2BC
        if(SelectedTabIndex == 1)
        {
            // End:0x21C
            if((((((ButtonName == 'XBoxTypeS_LeftStick_Up') || ButtonName == 'Gamepad_LeftStick_Up') || ButtonName == 'XBoxTypeS_RightStick_Up') || ButtonName == 'Gamepad_RightStick_Up') || ButtonName == 'XboxTypeS_DPad_Up') || ButtonName == 'Up')
            {
                SelectPrevPlayer();
                return true;
            }
            // End:0x2BC
            if((((((ButtonName == 'XBoxTypeS_LeftStick_Down') || ButtonName == 'Gamepad_LeftStick_Down') || ButtonName == 'XBoxTypeS_RightStick_Down') || ButtonName == 'Gamepad_RightStick_Down') || ButtonName == 'XboxTypeS_DPad_Down') || ButtonName == 'Down')
            {
                SelectNextPlayer();
                return true;
            }
        }        
    }
    else
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

function SelectPrevPlayer()
{
    local /*0x97E50000-0x00000000*/ private int CurrentTeamIndex, CurrentPlayerIndex;

    CurrentTeamIndex = SelectedTeamIndex;
    CurrentPlayerIndex = SelectedPlayerIndex;
    // End:0x8C
    if(SelectedTeamIndex == 0)
    {
        // End:0x70
        if((MatchDataIndicesTeam0.Length == 0) && MatchDataIndicesTeam1.Length > 0)
        {
            SelectedTeamIndex = 1;
            SelectedPlayerIndex = 0;            
        }
        else
        {
            SelectedPlayerIndex = Max(SelectedPlayerIndex - 1, 0);
        }        
    }
    else
    {
        // End:0xD5
        if((MatchDataIndicesTeam1.Length == 0) || SelectedPlayerIndex == 0)
        {
            SelectedTeamIndex = 0;
            SelectedPlayerIndex = Max(MatchDataIndicesTeam0.Length - 1, 0);            
        }
        else
        {
            SelectedPlayerIndex = SelectedPlayerIndex - 1;
        }
    }
    // End:0x174
    if((CurrentTeamIndex != SelectedTeamIndex) || CurrentPlayerIndex != SelectedPlayerIndex)
    {
        SetSelectedPlayer(SelectedTeamIndex, SelectedPlayerIndex);
        SetConfirmPromptVisible(CanShowSubMenu());
        Outer.PlaySoundFromTheme('ViewPlayerSelect');
    }
    //return;    
}

function SelectNextPlayer()
{
    local /*0x97E50000-0x00000000*/ private int CurrentTeamIndex, CurrentPlayerIndex;

    CurrentTeamIndex = SelectedTeamIndex;
    CurrentPlayerIndex = SelectedPlayerIndex;
    // End:0xA3
    if(SelectedTeamIndex == 0)
    {
        // End:0x7B
        if((SelectedPlayerIndex >= (MatchDataIndicesTeam0.Length - 1)) && MatchDataIndicesTeam1.Length > 0)
        {
            SelectedTeamIndex = 1;
            SelectedPlayerIndex = 0;            
        }
        else
        {
            SelectedPlayerIndex = Min(SelectedPlayerIndex + 1, MatchDataIndicesTeam0.Length - 1);
        }        
    }
    else
    {
        // End:0xCC
        if(MatchDataIndicesTeam1.Length == 0)
        {
            SelectedTeamIndex = 0;
            SelectedPlayerIndex = 0;            
        }
        else
        {
            SelectedPlayerIndex = Min(SelectedPlayerIndex + 1, MatchDataIndicesTeam1.Length - 1);
        }
    }
    // End:0x17A
    if((CurrentTeamIndex != SelectedTeamIndex) || CurrentPlayerIndex != SelectedPlayerIndex)
    {
        SetSelectedPlayer(SelectedTeamIndex, SelectedPlayerIndex);
        SetConfirmPromptVisible(CanShowSubMenu());
        Outer.PlaySoundFromTheme('ViewPlayerSelect');
    }
    //return;    
}

delegate OnContextMenuVisible()
{
    local /*0x97E50000-0x00000000*/ private bool bVisible[8388609], bIsFriend, bPS3, b360;
    local /*0x97E50000-0x00000000*/ private int OptionIndex, FocusIndex, MatchDataIndex;
    local /*0x97E50000-0x00000000*/ private editfixedsize array Actions;
    local /*0x97E50000-0x00000000*/ private byte A;

    bContextMenuOpen = bVisible;
    FocusIndex = 0;
    // End:0x38E
    if(bVisible)
    {
        // End:0x5C
        if(SelectedTeamIndex == 0)
        {
            MatchDataIndex = MatchDataIndicesTeam0[SelectedPlayerIndex];            
        }
        else
        {
            // End:0x88
            if(SelectedTeamIndex == 1)
            {
                MatchDataIndex = MatchDataIndicesTeam1[SelectedPlayerIndex];
            }
        }
        bPS3 = Class'Engine.WorldInfo'.static.IsConsoleBuild(2);
        b360 = Class'Engine.WorldInfo'.static.IsConsoleBuild(1);
        ContextMenu.InitFromUniqueID(MatchDataStore.MatchScores[MatchDataIndex].PlayerID, MatchDataStore.MatchScores[MatchDataIndex].PlayerTag);
        bIsFriend = ContextMenu.IsPlayerFriend();
        OptionIndex = 0;
        // End:0x226
        if(MatchDataStore.MatchScores[MatchDataIndex].bLocalPlayer)
        {
            Actions.AddItem(6);            
            // End:0x223
            if(b360 || bPS3)
            {
                Actions.AddItem(5);                
            }            
        }
        else
        {
            Actions.AddItem(1);            
            // End:0x267
            if(!bIsFriend && !b360)
            {
                Actions.AddItem(10);                                
            }
            else
            {
                // End:0x296
                if(!b360 && !bPS3)
                {
                    Actions.AddItem(11);                    
                }
            }
            Actions.AddItem(6);            
            // End:0x2D0
            if(b360 || bPS3)
            {
                Actions.AddItem(5);                
            }
            // End:0x312
            if(ContextMenu.OptionInfo[0].bIsDisabled)
            {
                FocusIndex = 1;
            }
        }
        SetSubMenuNumOptions(Actions.Length);
        // End:0x362
        foreach Actions(A, OptionIndex)
        {
            SetSubMenuOptionType(OptionIndex, A);            
        }        
        ContextMenu.SetFocusedOption(FocusIndex);        
    }
    else
    {
        SetSelectedPlayer(SelectedTeamIndex, SelectedPlayerIndex);
    }
    SetButtonPromptsVisible(!bVisible);
    //return;    
}

function ShowSubMenu()
{
    local /*0x97E50000-0x00000000*/ private bool bVisible[8388609];

    // End:0x140
    if(bVisible && !bContextMenuOpen)
    {
        // End:0x8B
        if(ContextMenu == none)
        {
            ContextMenu = LPGFxFrontEnd_ContextMenu(SPGFxMoviePlayerViewManager(MoviePlayer).ViewLoader.SpawnDialog('ContextMenu'));            
        }
        else
        {
            SPGFxMoviePlayerViewManager(MoviePlayer).ViewLoader.ConfigureTargetDialog(ContextMenu);
        }
        // End:0x13D
        if(ContextMenu != none)
        {
            ContextMenu.OnMenuVisibleDelegate = self.OnContextMenuVisible;
            ContextMenu.ShowMenu();
        }        
    }
    else
    {
        // End:0x17D
        if(!bVisible && bContextMenuOpen)
        {
            ContextMenu.MoveBackImpl();
        }
    }
    bContextMenuOpen = bVisible;
    //return;    
}

function SetSubMenuNumOptions()
{
    local /*0x97E50000-0x00000000*/ private int iCount[8388609];

    // End:0x37
    if(ContextMenu != none)
    {
        ContextMenu.SetNumOptions(iCount);
    }
    //return;    
}

function SetSubMenuOptionType()
{
    local /*0x97E50000-0x00000000*/ private int iIndex[8388609];
    local /*0x97E50000-0x00000000*/ private byte OptionType[8388609];

    // End:0x40
    if(ContextMenu != none)
    {
        ContextMenu.SetOptionType(iIndex, OptionType);
    }
    //return;    
}

function UpdateSubMenuOption()
{
    local /*0x97E50000-0x00000000*/ private int iIndex[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize string OptionName[8388609], OptionString;

    // End:0x40
    if(ContextMenu != none)
    {
        ContextMenu.SetOptionText(iIndex, OptionString);
    }
    //return;    
}

function DisableSubMenuOption()
{
    local /*0x97E50000-0x00000000*/ private int iIndex[8388609];
    local /*0x97E50000-0x00000000*/ private bool bDisabled[8388609];

    // End:0x41
    if(ContextMenu != none)
    {
        ContextMenu.SetOptionDisabled(iIndex, bDisabled);
    }
    //return;    
}

function CanShowSubMenu()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], bResult;
    local /*0x97E50000-0x00000000*/ private int TeamIndex, PlayerIndex;

    TeamIndex = SelectedTeamIndex;
    PlayerIndex = SelectedPlayerIndex;
    bResult = (((TeamIndex == 0) && PlayerIndex >= 0) && PlayerIndex < MatchDataIndicesTeam0.Length) || ((TeamIndex == 1) && PlayerIndex >= 0) && PlayerIndex < MatchDataIndicesTeam1.Length;
    return bResult;
    //return ReturnValue;    
}

function UpdateListDataProvider()
{
    local /*0x97E50000-0x00000000*/ private int SelectedIndex[9437185];

    0
    //return;    
}

function SetTab()
{
    local /*0x97E50000-0x00000000*/ private bool bScoreboard[8388609];

    ActionScriptVoid("switchToTab");
    //return;    
}

function SetScoreboardTab()
{
    ActionScriptVoid("scoreBoardTab");
    //return;    
}

function SetAwardsTab()
{
    ActionScriptVoid("awardsTab");
    //return;    
}

function ForceRefreshFocus()
{
    local /*0x97E50000-0x00000000*/ private int SelectionIndex[9437185];

    -1
    ActionScriptVoid("forceRefreshFocus");
    //return;    
}

function SetAwardsHeader()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string TabHeader[8388609];

    ActionScriptVoid("setAwardsTabHeaderText");
    //return;    
}

function SetAwardsCount()
{
    local /*0x97E50000-0x00000000*/ private int NumAwards[8388609];

    ActionScriptVoid("setNumAwards");
    //return;    
}

function SetAwardsCredits()
{
    local /*0x97E50000-0x00000000*/ private int MatchCredits[8388609], TotalCredits;

    ActionScriptVoid("setAwardsCreditsEarned");
    //return;    
}

function SetAwardData()
{
    local /*0x97E50000-0x00000000*/ private int Idx[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize string AwardIcon[8388609], AwardName, AwardDesc;
    local /*0x97E50000-0x00000000*/ private int AwardCount[8388609], AwardValue;

    ActionScriptVoid("updateAwardData");
    //return;    
}

function SetScoreboardHeader()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string TabHeader[8388609];

    ActionScriptVoid("setScoreboardTabHeaderText");
    //return;    
}

function SetWinningTeam()
{
    local /*0x97E50000-0x00000000*/ private bool bNevec[8388609];

    ActionScriptVoid("setWinningTeam");
    //return;    
}

function SetTeamHeaders()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string WinningTeam[8388609], LosingTeam;

    ActionScriptVoid("setScoreTeamHeaders");
    //return;    
}

function SetNumPlayers()
{
    local /*0x97E50000-0x00000000*/ private int WinningTeamPlayers[8388609], LosingTeamPlayers;

    ActionScriptVoid("setNumPlayersBothTeams");
    //return;    
}

function SetScoreData()
{
    local /*0x97E50000-0x00000000*/ private int TeamIdx[8388609], PlayerIdx;
    local /*0x97E50000-0x00000000*/ private editfixedsize string PlayerName[8388609];
    local /*0x97E50000-0x00000000*/ private int PlayerRank[8388609];
    local /*0x97E50000-0x00000000*/ private float Column0[8388609], Column1, Column2, Column3, Column4;

    local /*0x97E50000-0x00000000*/ private int TotalCredits[8388609];
    local /*0x97E50000-0x00000000*/ private bool bIsLocalPlayer[8388609];

    ActionScriptVoid("updateScoreboardData");
    //return;    
}

function SetTeamScoreData()
{
    local /*0x97E50000-0x00000000*/ private int TeamIdx[8388609];
    local /*0x97E50000-0x00000000*/ private float Column0[8388609], Column1, Column2, Column3, Column4;

    local /*0x97E50000-0x00000000*/ private int Credits[8388609];

    ActionScriptVoid("setTeamTotals");
    //return;    
}

function SetMatchInfo()
{
    local /*0x97E50000-0x00000000*/ private int Rounds[8388609], Seconds;

    ActionScriptVoid("setMatchInfo");
    //return;    
}

function SetSelectedPlayer()
{
    local /*0x97E50000-0x00000000*/ private int TeamNum[8388609], PlayerNum;

    ActionScriptVoid("setFocusedPlayer");
    //return;    
}

function SetButtonPromptsVisible()
{
    local /*0x97E50000-0x00000000*/ private bool bVisible[8388609];

    ActionScriptVoid("setButtonPromptsVisible");
    //return;    
}

function SetConfirmPromptVisible()
{
    local /*0x97E50000-0x00000000*/ private bool bVisible[8388609];

    ActionScriptVoid("setConfirmPromptVisible");
    //return;    
}

function BackPressed()
{
    // End:0x19
    if(!bContextMenuOpen)
    {
        MoveBackImpl();
    }
    //return;    
}

function PlayerSelected()
{
    local /*0x97E50000-0x00000000*/ private int TeamIndex[8388609], PlayerIndex;

    SelectedTeamIndex = TeamIndex;
    SelectedPlayerIndex = PlayerIndex;
    // End:0x67
    if(CanShowSubMenu())
    {
        Outer.PlaySoundFromTheme(ListItemPressSoundEventName);
        ShowSubMenu(true);
    }
    //return;    
}

defaultproperties
{
    ListItemPressSoundEventNameMP="ViewPlayerConfirm"
    ListChangeSoundEventNameMP="RecordsVertical"
    SubWidgetBindings=/* Array type was not detected. */
}