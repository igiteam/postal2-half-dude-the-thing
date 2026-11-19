class LPGFxFrontEnd_Leaderboards extends LPGFxFrontEnd_Screen within GFxMoviePlayer
    config(UI);

const TotalWidgetCount = 20;

enum eRecordsLeaderboardFilter
{
    RLF_All,                        // 0
    RLF_Friends,                    // 1
    RLF_MAX                         // 2
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

struct LeaderboardDisplay
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string DisplayName;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string Column2Text;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string ReaderClassName;

    structdefaultproperties
    {
        DisplayName=""
        Column2Text=""
        ReaderClassName=""
    }
};

struct LeaderboardDisplayRow
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private int Rank;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string NickName;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string Value;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL PlayerID;

    structdefaultproperties
    {
        Rank=0
        NickName=""
        Value=""
        PlayerID=(Uid=(Data=none,Data[1]=none,Data[2]=none,Data[3]=none,Data[4]=none,Data[5]=none,Data[6]=none,Data[7]=none))
    }
};

var(0.25_Pct) /*0x97E50000-0x00000000*/ private int WidgetCount[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bAllWidgetsInit[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bFocusOnPlayer;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bIsReadingFriends;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bFriendsReadSuccessful;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bIsReadingLeaderboard;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bPlayerHasLeaderboardEntry;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte LeaderFilterType[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array WidgetList;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL OSI[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL LeaderboardStatsRead[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array LeaderboardDisplays[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array DisplayRows;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int CurrentLeaderboard[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float LeaderboardReadStartTime;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float LeaderboardReadTimeout;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int ReadLeaderboardAttempt;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL SortLabel;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL PageLabel;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL BackLabel;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL SelectLabel;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL DetailsLabel;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL GamerCardLabel;
//var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> __LeaderSort__Delegate;

function OnTopMostView()
{
    local /*0x97E50000-0x00000000*/ private bool bPlayOpenAnimation[9437185];
    local /*0x97E50000-0x00000000*/ private name previousView[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL dummyButton;

    false
    'None'
    super.OnTopMostView(bPlayOpenAnimation, previousView);
    dummyButton = GetObject("dummyButton");
    MenuViewLoader.SetSelectionFocus(dummyButton);
    MoviePlayer.SetExternalInterface(self);
    SetUpButtonLegend();
    OSI = Class'Engine.GameEngine'.static.GetOnlineSubsystem().StatsInterface;
    RefreshFriends();
    CurrentLeaderboard = 0;
    ReadCurrentLeaderboard();
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
    local /*0x97E50000-0x00000000*/ private bool bShowGamercardPrompt;

    // End:0x19
    if(SortLabel != none)
    {
        SetFocusText();
    }
    // End:0x9A
    if(PageLabel != none)
    {
        PageLabel.SetText(GetLocalizedString("<Strings:LostPlanetGame.LPGFxFrontEnd_PlayerRecords.Widget_PageString>"));
    }
    // End:0x11B
    if(BackLabel != none)
    {
        BackLabel.SetText(GetLocalizedString("<Strings:LostPlanetGame.LPGFxFrontEnd_PlayerRecords.Widget_BackString>"));
    }
    // End:0x19E
    if(SelectLabel != none)
    {
        SelectLabel.SetText(GetLocalizedString("<Strings:LostPlanetGame.LPGFxFrontEnd_PlayerRecords.Widget_SelectString>"));
    }
    SetPreviousTabText(GetLocalizedString("<Strings:LostPlanetGame.LPGFxFrontEnd_PlayerRecords.LeaderPrev>"));
    SetNextTabText(GetLocalizedString("<Strings:LostPlanetGame.LPGFxFrontEnd_PlayerRecords.LeaderNext>"));
    bShowGamercardPrompt = (LeaderboardStatsRead != none) && LeaderboardStatsRead.Rows.Length > 0;
    // End:0x3B6
    if(DetailsLabel != none)
    {
        // End:0x33C
        if(bShowGamercardPrompt && Class'Engine.WorldInfo'.static.IsConsoleBuild(1))
        {
            DetailsLabel.SetText(GetLocalizedString("<Strings:LostPlanetGame.LPGFxFrontEnd_PlayerRecords.Widget_GamerCard>"));            
        }
        else
        {
            // End:0x394
            if(bShowGamercardPrompt && Class'Engine.WorldInfo'.static.IsConsoleBuild(2))
            {
                DetailsLabel.SetText("");                
            }
            else
            {
                DetailsLabel.SetText("");
            }
        }
    }
    ActionScriptVoid("repositionPrompts");
    //return;    
}

function RefreshFriends()
{
    local /*0x97E50000-0x00000000*/ private bool bForce[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL OnlineSub;
    local /*0x97E50000-0x00000000*/ private int ControllerId;

    // End:0x10
    if(bIsReadingFriends)
    {
        return;
    }
    // End:0x30
    if(bFriendsReadSuccessful && !bForce)
    {
        return;
    }
    OnlineSub = Class'Engine.GameEngine'.static.GetOnlineSubsystem();
    ControllerId = Outer.GetLP().ControllerId;
    // End:0x188
    if((OnlineSub != none) && NotEqual_InterfaceInterface(OnlineSub.PlayerInterface, OnlinePlayerInterface(none)))
    {
        bIsReadingFriends = true;
        bFriendsReadSuccessful = false;
        OnlineSub.PlayerInterface.AddReadFriendsCompleteDelegate(byte(ControllerId), OnReadFriendsComplete);
        OnlineSub.PlayerInterface.ReadFriendsList(byte(ControllerId));
    }
    //return;    
}

function ClearReadFriendsCompleteDelegate()
{
    local /*0x97E50000-0x00000000*/ private int I;
    local /*0x97E50000-0x00000000*/ private @NULL OnlineSub;

    bIsReadingFriends = false;
    OnlineSub = Class'Engine.GameEngine'.static.GetOnlineSubsystem();
    // End:0xF5
    if((OnlineSub != none) && NotEqual_InterfaceInterface(OnlineSub.PlayerInterface, OnlinePlayerInterface(none)))
    {
        I = 0;
        J0x86:

        // End:0xF5 [Loop If]
        if(I < 4)
        {
            OnlineSub.PlayerInterface.ClearReadFriendsCompleteDelegate(byte(I), OnReadFriendsComplete);
            I++;
            // [Loop Continue]
            goto J0x86;
        }
    }
    //return;    
}

function OnReadFriendsComplete()
{
    local /*0x97E50000-0x00000000*/ private bool bWasSuccessful[8388609];

    ClearReadFriendsCompleteDelegate();
    bFriendsReadSuccessful = bWasSuccessful;
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
                    if(WidgetName == 'GamerCard')
                    {
                        GamerCardLabel = Widget;
                        RefreshButtonPrompts();
                        bResult = true;                        
                    }
                    else
                    {
                        // End:0x245
                        if(WidgetName == 'DetailsString')
                        {
                            DetailsLabel = Widget;
                            RefreshButtonPrompts();
                            bResult = true;                            
                        }
                        else
                        {
                            LocalizedString = GetLocalizedString(("<Strings:LostPlanetGame.LPGFxFrontEnd_PlayerRecords.Widget_" $ string(WidgetName)) $ ">");
                            // End:0x2F3
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
    // End:0x349
    if(WidgetName == 'leaderboardsList')
    {
        // End:0x349
        if(ListMC == none)
        {
            ListMC = GFxClikWidget(Widget);
            SetList(ListMC);
        }
    }
    WidgetCount++;
    // End:0x37A
    if(WidgetCount == 20)
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
    InitLeaderboardsTab();
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
    // End:0x13C
    if((ButtonName == 'XboxTypeS_Y') || ButtonName == 'Two')
    {
        // End:0x130
        if((CanSwitchLeaderboards()) && int(InputEvent) == int(0))
        {
            bFocusOnPlayer = !bFocusOnPlayer;
            ReadCurrentLeaderboard();
            Outer.PlaySoundFromTheme('RecordsFocusPlayerSort');
        }
        bResult = true;
    }
    // End:0x197
    if((ButtonName == 'XboxTypeS_LeftTrigger') || ButtonName == 'Five')
    {
        // End:0x18B
        if(int(InputEvent) == int(0))
        {
            LeaderboardChangePage(true);
        }
        bResult = true;
    }
    // End:0x1F2
    if((ButtonName == 'XboxTypeS_RightTrigger') || ButtonName == 'Six')
    {
        // End:0x1E6
        if(int(InputEvent) == int(0))
        {
            LeaderboardChangePage(false);
        }
        bResult = true;
    }
    // End:0x284
    if((ButtonName == 'XboxTypeS_LeftShoulder') || ButtonName == 'Three')
    {
        // End:0x278
        if((CanSwitchLeaderboards()) && int(InputEvent) == int(0))
        {
            Outer.PlaySoundFromTheme('RecordsBumper1');
            PreviousLeaderboard();
        }
        bResult = true;
    }
    // End:0x316
    if((ButtonName == 'XboxTypeS_RightShoulder') || ButtonName == 'Four')
    {
        // End:0x30A
        if((CanSwitchLeaderboards()) && int(InputEvent) == int(0))
        {
            Outer.PlaySoundFromTheme('RecordsBumper1');
            NextLeaderboard();
        }
        bResult = true;
    }
    // End:0x39F
    if(((ButtonName == 'Gamepad_LeftStick_Right') || ButtonName == 'XboxTypeS_DPad_Right') || ButtonName == 'Right')
    {
        // End:0x393
        if((CanSwitchLeaderboards()) && int(InputEvent) == int(0))
        {
            SwitchLeaderboardsCategory("right");
        }
        bResult = true;
    }
    // End:0x427
    if(((ButtonName == 'Gamepad_LeftStick_Left') || ButtonName == 'XboxTypeS_DPad_Left') || ButtonName == 'Left')
    {
        // End:0x41B
        if((CanSwitchLeaderboards()) && int(InputEvent) == int(0))
        {
            SwitchLeaderboardsCategory("left");
        }
        bResult = true;
    }
    return bResult;
    //return ReturnValue;    
}

function CanSwitchLeaderboards()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return !bIsReadingLeaderboard;
    //return ReturnValue;    
}

function ShowPlayerProfile()
{
    local /*0x97E50000-0x00000000*/ private int LeaderboardIndex[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL OnlineSub;

    // End:0x147
    if(Class'Engine.WorldInfo'.static.GetWorldInfo().IsConsoleBuild(1))
    {
        // End:0x147
        if((LeaderboardIndex >= 0) && LeaderboardIndex < DisplayRows.Length)
        {
            OnlineSub = Class'Engine.GameEngine'.static.GetOnlineSubsystem();
            OnlineSub.PlayerInterfaceEx.ShowGamerCardUI(byte(Outer.GetLP().ControllerId), DisplayRows[LeaderboardIndex].PlayerID);
            Outer.PlaySoundFromTheme('RecordsProfile');
        }
    }
    //return;    
}

function SwitchLeaderboardsCategory()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string Dir[8388609];

    SuppressDefaultSoundEvents(true);
    ActionScriptVoid("switchLeaderboardsCategory");
    //return;    
}

function OnViewUnloaded()
{
    ClearReadFriendsCompleteDelegate();
    CancelRead();
    super.OnViewUnloaded();
    //return;    
}

function MoveBackImpl()
{
    ClearReadFriendsCompleteDelegate();
    CancelRead();
    super(SPGFxUIView).MoveBackImpl();
    //return;    
}

function CancelRead()
{
    bIsReadingLeaderboard = false;
    // End:0x57
    if(LeaderboardStatsRead != none)
    {
        LeaderboardStatsRead = none;
        OSI.ClearReadOnlineStatsCompleteDelegate(ReadOnlineStatsComplete);
    }
    //return;    
}

function LeaderboardsTabSwitched()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string leftRight[8388609];

    // End:0x24
    if(leftRight == "tabLeft")
    {
        PreviousLeaderboard();        
    }
    else
    {
        NextLeaderboard();
    }
    //return;    
}

function PreviousLeaderboard()
{
    CurrentLeaderboard--;
    // End:0x31
    if(CurrentLeaderboard < 0)
    {
        CurrentLeaderboard = LeaderboardDisplays.Length - 1;
    }
    ReadCurrentLeaderboard();
    //return;    
}

function NextLeaderboard()
{
    CurrentLeaderboard++;
    // End:0x31
    if(CurrentLeaderboard > (LeaderboardDisplays.Length - 1))
    {
        CurrentLeaderboard = 0;
    }
    ReadCurrentLeaderboard();
    //return;    
}

function ReadCurrentLeaderboard()
{
    local /*0x97E50000-0x00000000*/ private bool bSuccess;
    local /*0x97E50000-0x00000000*/ private class ReaderClass;
    local /*0x97E50000-0x00000000*/ private float CurrentTime;

    SuppressDefaultSoundEvents(true);
    CancelRead();
    SetTabHeaderText(GetLocalizedString(LeaderboardDisplays[CurrentLeaderboard].DisplayName));
    SetLeaderColumn2HeaderText(GetLocalizedString(LeaderboardDisplays[CurrentLeaderboard].Column2Text));
    SetLeaderCount(1);
    UpdateLeaderData(0, "", GetLocalizedString("<Strings:LostPlanetGame.UpdatingStrings.RetrieveScore>"), "");
    CurrentTime = Class'Engine.WorldInfo'.static.GetWorldInfo().TimeSeconds;
    // End:0x157
    if(LeaderboardReadStartTime < float(0))
    {
        LeaderboardReadStartTime = CurrentTime;
        bPlayerHasLeaderboardEntry = true;        
    }
    else
    {
        // End:0x204
        if((CurrentTime - LeaderboardReadStartTime) > LeaderboardReadTimeout)
        {
            LeaderboardReadStartTime = -1.0000000;
            ReadLeaderboardAttempt = 0;
            UpdateLeaderData(0, "", GetLocalizedString("<Strings:LostPlanetGame.UpdatingStrings.LeaderboardReadError>"), "");
            CancelRead();
            RefreshButtonPrompts();
            return;            
        }
        else
        {
            // End:0x255
            if(ReadLeaderboardAttempt > 5)
            {
                LeaderboardReadStartTime = -1.0000000;
                ReadLeaderboardAttempt = 0;
                UpdateLeaderData(0, "", "", "");
                CancelRead();
                RefreshButtonPrompts();
                return;
            }
        }
    }
    bIsReadingLeaderboard = true;
    ReaderClass = class<LPLeaderBoardRead>(FindObject(LeaderboardDisplays[CurrentLeaderboard].ReaderClassName, Class'Core.Class'));
    // End:0x504
    if(ReaderClass != none)
    {
        LeaderboardStatsRead = new ReaderClass;
        OSI.AddReadOnlineStatsCompleteDelegate(ReadOnlineStatsComplete);
        bSuccess = false;
        // End:0x3EA
        if(int(LeaderFilterType) == int(0))
        {
            // End:0x3B0
            if(bFocusOnPlayer && bPlayerHasLeaderboardEntry)
            {
                bSuccess = OSI.ReadOnlineStatsByRankAroundPlayer(byte(Outer.GetLP().ControllerId), LeaderboardStatsRead, 100);                
            }
            else
            {
                bSuccess = OSI.ReadOnlineStatsByRank(LeaderboardStatsRead, 1, 100);
            }            
        }
        else
        {
            // End:0x407
            if(!bFriendsReadSuccessful)
            {
                RefreshFriends();                
            }
            else
            {
                bSuccess = OSI.ReadOnlineStatsForFriends(byte(Outer.GetLP().ControllerId), LeaderboardStatsRead);
            }
        }
        // End:0x4C3
        if(bSuccess)
        {
            Outer.GetPC().SetTimer(LeaderboardReadTimeout, false, 'ReadOnlineStatsTimeout', self);            
        }
        else
        {
            Outer.GetPC().SetTimer(0.1000000, false, 'ReadCurrentLeaderboard', self);
        }        
    }
    //return;    
}

function ReadOnlineStatsTimeout()
{
    ReadOnlineStatsComplete(false);
    //return;    
}

function ReadOnlineStatsComplete()
{
    local /*0x97E50000-0x00000000*/ private bool bWasSuccessful[8388609];
    local /*0x97E50000-0x00000000*/ private int I, NewIndex, PlayerIndex;
    local /*0x97E50000-0x00000000*/ private @NULL OnlineSub;
    local /*0x97E50000-0x00000000*/ private editfixedsize string PlayerName, DisplayRank;
    local /*0x97E50000-0x00000000*/ private editfixedsize array Friends;

    bIsReadingLeaderboard = false;
    Outer.GetPC().ClearTimer('ReadOnlineStatsTimeout', self);
    OSI.ClearReadOnlineStatsCompleteDelegate(ReadOnlineStatsComplete);
    SuppressDefaultSoundEvents(false);
    SetLeaderIndex(-1, false);
    SetPlayerIndex(-1);
    RefreshButtonPrompts();
    PlayerIndex = -1;
    DisplayRows.Length = 0;
    // End:0x8A1
    if(bWasSuccessful)
    {
        // End:0x14F
        if(((LeaderboardStatsRead.Rows.Length == 0) && int(LeaderFilterType) == int(0)) && bFocusOnPlayer)
        {
            bPlayerHasLeaderboardEntry = false;
            RefreshButtonPrompts();
            ReadCurrentLeaderboard();
            ReadLeaderboardAttempt++;
            return;
        }
        LeaderboardReadStartTime = -1.0000000;
        ReadLeaderboardAttempt = 0;
        OnlineSub = Class'Engine.GameEngine'.static.GetOnlineSubsystem();
        PlayerName = OnlineSub.PlayerInterface.GetPlayerNickname(byte(Outer.GetLP().ControllerId));
        DisplayRows.Length = LeaderboardStatsRead.Rows.Length;
        I = 0;
        J0x23C:

        // End:0x40D [Loop If]
        if(I < LeaderboardStatsRead.Rows.Length)
        {
            DisplayRows[I].Rank = int(LeaderboardStatsRead.SettingsDataToString(LeaderboardStatsRead.Rows[I].Rank));
            DisplayRows[I].NickName = LeaderboardStatsRead.Rows[I].NickName;
            DisplayRows[I].Value = LeaderboardStatsRead.GetValueString(I);
            DisplayRows[I].PlayerID = LeaderboardStatsRead.Rows[I].PlayerID;
            I++;
            // [Loop Continue]
            goto J0x23C;
        }
        // End:0x6C1
        if(int(LeaderFilterType) == int(1))
        {
            OnlineSub.PlayerInterface.GetFriendsList(byte(Outer.GetLP().ControllerId), Friends);
            // End:0x643
            if(DisplayRows.Length < (Friends.Length + 1))
            {
                I = 0;
                J0x4BE:

                // End:0x643 [Loop If]
                if(I < Friends.Length)
                {
                    // End:0x635
                    if(DisplayRows.Find('NickName', Friends[I].NickName) == )
                    {                        
                        NewIndex = DisplayRows.Length;
                        DisplayRows.Length = DisplayRows.Length + 1;
                        DisplayRows[NewIndex].Rank = 0;
                        DisplayRows[NewIndex].NickName = Friends[I].NickName;
                        DisplayRows[NewIndex].Value = "--";
                        DisplayRows[NewIndex].PlayerID = Friends[I].UniqueId;
                    }
                    I++;
                    // [Loop Continue]
                    goto J0x4BE;
                }
            }
            // End:0x6C1
            if(DisplayRows.Length != (Friends.Length + 1))
            {
                I = 0;
                J0x66A:

                // End:0x690 [Loop If]
                if(I < DisplayRows.Length)
                {
                    I++;
                    // [Loop Continue]
                    goto J0x66A;
                }
                I = 0;
                J0x69B:

                // End:0x6C1 [Loop If]
                if(I < Friends.Length)
                {
                    I++;
                    // [Loop Continue]
                    goto J0x69B;
                }
            }
        }        
        DisplayRows.Sort(LeaderSort);        
        SetLeaderCount(DisplayRows.Length);
        I = 0;
        J0x707:

        // End:0x853 [Loop If]
        if(I < DisplayRows.Length)
        {
            // End:0x779
            if(DisplayRows[I].NickName == PlayerName)
            {
                PlayerIndex = I;
                SetPlayerIndex(PlayerIndex);
            }
            DisplayRank = ((DisplayRows[I].Rank > 0) ? string(DisplayRows[I].Rank) : "--");
            UpdateLeaderData(I, DisplayRank, DisplayRows[I].NickName, DisplayRows[I].Value);
            I++;
            // [Loop Continue]
            goto J0x707;
        }
        SetLeaderIndex(((bFocusOnPlayer && bPlayerHasLeaderboardEntry) ? PlayerIndex : 0), bFocusOnPlayer && bPlayerHasLeaderboardEntry);        
    }
    else
    {
        ReadCurrentLeaderboard();
    }
    //return;    
}

function InitLeaderboardsTab()
{
    SetHeaderText(GetLocalizedStringShort("LeaderHeader"));
    SetPreviousTabText(GetLocalizedString("<Strings:LostPlanetGame.LPGFxFrontEnd_PlayerRecords.LeaderPrev>"));
    SetNextTabText(GetLocalizedString("<Strings:LostPlanetGame.LPGFxFrontEnd_PlayerRecords.LeaderNext>"));
    SetLeaderIndexHeaderText(GetLocalizedStringShort("LeaderColIdx"));
    // End:0x13B
    if(Class'Engine.WorldInfo'.static.IsConsoleBuild(1))
    {
        SetLeaderPlayerNameHeaderText(GetLocalizedStringShort("LeaderColName360"));        
    }
    else
    {
        // End:0x188
        if(Class'Engine.WorldInfo'.static.IsConsoleBuild(2))
        {
            SetLeaderPlayerNameHeaderText(GetLocalizedStringShort("LeaderColNamePS3"));            
        }
        else
        {
            SetLeaderPlayerNameHeaderText(GetLocalizedStringShort("LeaderColName"));
        }
    }
    AddLeaderCategory(GetLocalizedStringShort("LeaderCat1"));
    AddLeaderCategory(GetLocalizedStringShort("LeaderCat2"));
    SetFocusText();
    SetLeaderIndex(0, false);
    //return;    
}

function SetFocusText()
{
    // End:0x34
    if(bFocusOnPlayer)
    {
        SetSortText(GetLocalizedStringShort("LeaderTopFocus"));        
    }
    else
    {
        SetSortText(GetLocalizedStringShort("LeaderPlayerFocus"));
    }
    //return;    
}

function OnLeaderCategoryChange()
{
    local /*0x97E50000-0x00000000*/ private int LeaderFilterTypeIdx[8388609];

    LeaderFilterType = byte(LeaderFilterTypeIdx);
    Outer.PlaySoundFromTheme('RecordsHorizontal');
    ReadCurrentLeaderboard();
    //return;    
}

function LeaderboardChangePage()
{
    local /*0x97E50000-0x00000000*/ private bool bPgUp[8388609];
    local /*0x97E50000-0x00000000*/ private int NewIndex, PrevIndex;

    PrevIndex = GetLeaderIndex();
    NewIndex = Clamp(((bPgUp) ? PrevIndex - 10 : PrevIndex + 10), 0, (GetLeaderCount()) - 1);
    // End:0xC1
    if(NewIndex != PrevIndex)
    {
        SuppressDefaultSoundEvents(true);
        Outer.PlaySoundFromTheme('RecordsBumper2');
        SetLeaderIndex(NewIndex, false);
        SuppressDefaultSoundEvents(false);
    }
    //return;    
}

function UpdateListDataProvider()
{
    local /*0x97E50000-0x00000000*/ private int SelectedIndex[9437185];

    0
    //return;    
}

delegate LeaderSort()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL A[8388609], B;
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];

    // End:0x86
    if(A.Rank == B.Rank)
    {
        return ((A.NickName > B.NickName) ? -1 : 0);        
    }
    else
    {
        // End:0xB1
        if(A.Rank == 0)
        {
            return -1;            
        }
        else
        {
            // End:0xD8
            if(B.Rank == 0)
            {
                return 0;                
            }
            else
            {
                return ((A.Rank > B.Rank) ? -1 : 0);
            }
        }
    }
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

    ActionScriptVoid("setLeaderboardsHeaderText");
    //return;    
}

function SetSortArrow()
{
    local /*0x97E50000-0x00000000*/ private int ColIdx[8388609];
    local /*0x97E50000-0x00000000*/ private bool bReverse[8388609];

    ActionScriptVoid("setSortArrowEx");
    //return;    
}

function SetLeaderHeaderText()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string Idx[8388609], PlayerName, Col1, Col2, Col3, Col4;

    ActionScriptVoid("setLeaderHeaderText");
    //return;    
}

function SetLeaderIndex()
{
    local /*0x97E50000-0x00000000*/ private int SelectedIndex[8388609];
    local /*0x97E50000-0x00000000*/ private bool Center[8388609];

    ActionScriptVoid("setLeaderboardSelection");
    //return;    
}

function SetPlayerIndex()
{
    local /*0x97E50000-0x00000000*/ private int Index[8388609];

    ActionScriptVoid("setPlayerIndex");
    //return;    
}

function GetLeaderIndex()
{
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];

    return ActionScriptInt("getLeaderboardSelection");
    //return ReturnValue;    
}

function GetLeaderCount()
{
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];

    return ActionScriptInt("getNumLeaders");
    //return ReturnValue;    
}

function SetLeaderCount()
{
    local /*0x97E50000-0x00000000*/ private int NumLeaders[8388609];

    ActionScriptVoid("setNumLeaders");
    //return;    
}

function AddLeaderCategory()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string CategoryName[8388609];

    ActionScriptVoid("addLeaderboardsCategory");
    //return;    
}

function UpdateLeaderData()
{
    local /*0x97E50000-0x00000000*/ private int Idx[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize string LeaderIdx[8388609], PlayerName, stat1;

    ActionScriptVoid("updateLeaderData");
    //return;    
}

function SetPreviousTabText()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string Text[8388609];

    ActionScriptVoid("setPreviousTabText");
    //return;    
}

function SetNextTabText()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string Text[8388609];

    ActionScriptVoid("setNextTabText");
    //return;    
}

function SetTabHeaderText()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string Text[8388609];

    ActionScriptVoid("setTabHeaderText");
    //return;    
}

function SetLeaderIndexHeaderText()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string Text[8388609];

    ActionScriptVoid("setLeaderIndexHeaderText");
    //return;    
}

function SetLeaderPlayerNameHeaderText()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string Text[8388609];

    ActionScriptVoid("setLeaderPlayerNameHeaderText");
    //return;    
}

function SetLeaderColumn2HeaderText()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string Text[8388609];

    ActionScriptVoid("setLeaderColumn2HeaderText");
    //return;    
}

function SetSortText()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string Text[8388609];

    ActionScriptVoid("setSortText");
    //return;    
}

defaultproperties
{
    bFocusOnPlayer=true
    LeaderboardDisplays=/* Array type was not detected. */
    LeaderboardReadStartTime=-1.0000000
    LeaderboardReadTimeout=120.0000000
    ListChangeSoundEventNameMP="RecordsVertical"
    bShouldHideViewStack=false
    SubWidgetBindings=/* Array type was not detected. */
}