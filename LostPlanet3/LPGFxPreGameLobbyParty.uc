class LPGFxPreGameLobbyParty extends LPGFxPreGameLobbyBase within GFxMoviePlayer;

struct PlayerTableInfo
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private int Row;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string PlayerName;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private int PriIndex;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private int PlayerID;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL NetId;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private int MetagamePercent;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private int PingQuality;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte VoiceStatus;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bIsHost;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bIsLocalPlayer;

    structdefaultproperties
    {
        Row=0
        PlayerName=""
        PriIndex=0
        PlayerID=0
        NetId=(Uid=(Data=none,Data[1]=none,Data[2]=none,Data[3]=none,Data[4]=none,Data[5]=none,Data[6]=none,Data[7]=none))
        MetagamePercent=0
        PingQuality=0
        VoiceStatus=PlayerVoiceStatus.ePlayerVoiceStatus_Enabled
        bIsHost=false
        bIsLocalPlayer=false
    }
};

struct TeamTableInfo
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private int TeamIndex;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private int PlayerCount;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array Players;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private int MaxPlayers;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string TeamName;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TeamColor;

    structdefaultproperties
    {
        TeamIndex=0
        PlayerCount=0
        Players=none
        MaxPlayers=0
        TeamName=""
        TeamColor=(R=0,G=0,B=0,A=0)
    }
};

var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bIsDirty;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bContextMenuOpen;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array Teams;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int MaxPlayers;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int MaxTeams;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ContextMenu;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int SelectedTeamIndex;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int SelectedPlayerIndex;
//var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> __OnContextMenuVisible__Delegate;

function InitCommon()
{
    UpdateMaxPlayers();
    MyGRI.OnGameSettingsChanged.AddItem(UpdateMaxPlayers);    
    MyGRI.OnLobbyStateChanged.AddItem(OnLobbyStateChanged);    
    //return;    
}

function InitQuickMatch()
{
    BuildTeamTable(0, MaxPlayers * MaxTeams);
    bIsDirty = true;
    Outer.GetPC().SetTimer(1.0000000, false, 'OnInitQuickMatchTimer', self);
    //return;    
}

function OnInitQuickMatchTimer()
{
    bIsDirty = true;
    //return;    
}

function Cleanup()
{
    local /*0x97E50000-0x00000000*/ private int I;
    local /*0x97E50000-0x00000000*/ private @NULL LPMenuPRI;

    I = 0;
    J0x0B:

    // End:0xC3 [Loop If]
    if(I < MyGRI.PRIArray.Length)
    {
        LPMenuPRI = LPMenuGamePRI(MyGRI.PRIArray[I]);
        // End:0xB5
        if(LPMenuPRI != none)
        {
            LPMenuPRI.MPPlayerInfoChangedDelegates.RemoveItem(OnPlayerInfoChanged);            
        }
        I++;
        // [Loop Continue]
        goto J0x0B;
    }
    MyGRI.OnGameSettingsChanged.RemoveItem(UpdateMaxPlayers);    
    MyGRI.OnLobbyStateChanged.RemoveItem(OnLobbyStateChanged);    
    //return;    
}

function BuildTeams()
{
    local /*0x97E50000-0x00000000*/ private int NumTeams, I;

    // End:0x11
    if(MyGRI == none)
    {
        return;
    }
    NumTeams = Min(MyGRI.Teams.Length, MaxTeams);
    I = 0;
    J0x50:

    // End:0x91 [Loop If]
    if(I < NumTeams)
    {
        BuildTeamTable(I, MaxPlayers);
        I++;
        // [Loop Continue]
        goto J0x50;
    }
    //return;    
}

function ASSetConfirmPromptVisible()
{
    local /*0x97E50000-0x00000000*/ private bool bVisible[8388609];

    RootMC.ActionScriptVoid("setConfirmPromptVisible");
    //return;    
}

function ASSetButtonPromptsVisible()
{
    local /*0x97E50000-0x00000000*/ private bool bVisible[8388609];

    RootMC.ActionScriptVoid("setButtonPromptsVisible");
    //return;    
}

function ASSetSelectedPlayer()
{
    local /*0x97E50000-0x00000000*/ private int TeamIndex[8388609], PlayerIndex;

    RootMC.ActionScriptVoid("setFocusedPlayer");
    //return;    
}

function SetTeamColor()
{
    local /*0x97E50000-0x00000000*/ private int TeamIndex[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL TeamColor[8388609];

    // End:0xD8
    if(Teams[TeamIndex].TeamColor != TeamColor)
    {
        Teams[TeamIndex].TeamColor = TeamColor;
        ASSetTeamColor(TeamIndex, int(TeamColor.R), int(TeamColor.G), int(TeamColor.B));
    }
    //return;    
}

function ASSetTeamColor()
{
    local /*0x97E50000-0x00000000*/ private int TeamIndex[8388609], R, G, B;

    RootMC.ActionScriptVoid("setTeamColor");
    //return;    
}

function SetTeamNumFields()
{
    local /*0x97E50000-0x00000000*/ private int TeamIndex[8388609], Num;

    // End:0x7E
    if(TeamIndex < Teams.Length)
    {
        // End:0x4E
        if(Teams[TeamIndex].MaxPlayers == Num)
        {
            return;
        }
        Teams[TeamIndex].MaxPlayers = Num;
    }
    // End:0xA3
    if(TeamIndex == 0)
    {
        ASSetTeam0NumFields(Num);        
    }
    else
    {
        // End:0xC5
        if(TeamIndex == 1)
        {
            ASSetTeam1NumFields(Num);
        }
    }
    //return;    
}

function ASSetTeam0NumFields()
{
    local /*0x97E50000-0x00000000*/ private int Num[8388609];

    RootMC.ActionScriptVoid("setTeam0NumFields");
    //return;    
}

function ASSetTeam1NumFields()
{
    local /*0x97E50000-0x00000000*/ private int Num[8388609];

    RootMC.ActionScriptVoid("setTeam1NumFields");
    //return;    
}

function ASsetTeamNumVisibleFields()
{
    local /*0x97E50000-0x00000000*/ private int iTeam[8388609], iCount;

    RootMC.ActionScriptVoid("setTeamNumVisibleFields");
    //return;    
}

function ASSetTeamName()
{
    local /*0x97E50000-0x00000000*/ private int TeamIndex[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize string TeamName[8388609];

    // End:0x90
    if(Teams[TeamIndex].TeamName != TeamName)
    {
        Teams[TeamIndex].TeamName = TeamName;
        RootMC.ActionScriptVoid("setTeamName");
    }
    //return;    
}

function ASSetPlayerData()
{
    local /*0x97E50000-0x00000000*/ private int Team[8388609], Index;
    local /*0x97E50000-0x00000000*/ private editfixedsize string PlayerName[8388609];
    local /*0x97E50000-0x00000000*/ private int Rank[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize string chat[8388609];
    local /*0x97E50000-0x00000000*/ private int playerPing[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize string hasMapString[8388609];
    local /*0x97E50000-0x00000000*/ private bool bIsLocalPlayer[8388609];

    RootMC.ActionScriptVoid("setPlayerData");
    //return;    
}

function setTabText()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string MatchSettingsText[8388609], SkinChooserText, KitSelectionText;

    RootMC.ActionScriptVoid("setTabText");
    //return;    
}

function BuildTeamTable()
{
    local /*0x97E50000-0x00000000*/ private int TeamIndex[8388609], NumPlayers;
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL TeamTable;
    local /*0x97E50000-0x00000000*/ private int Players;
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL Row;

    TeamTable.TeamIndex = TeamIndex;
    TeamTable.PlayerCount = 0;
    Players = 0;
    J0x4F:

    // End:0x164 [Loop If]
    if(Players < NumPlayers)
    {
        Row.Row = Players;
        Row.PlayerName = "";
        Row.PriIndex = -1;
        Row.PlayerID = -1;
        Row.bIsHost = false;
        Row.bIsLocalPlayer = false;
        TeamTable.Players.AddItem(Row);        
        ++Players;
        // [Loop Continue]
        goto J0x4F;
    }
    Teams[TeamIndex] = TeamTable;
    //return;    
}

event FilterButtonInput()
{
    local /*0x97E50000-0x00000000*/ private int ControllerId[8388609];
    local /*0x97E50000-0x00000000*/ private name ButtonName[8388609];
    local /*0x97E50000-0x00000000*/ private byte InputEvent[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], Retval;

    // End:0xCD
    if((((((ButtonName == 'XBoxTypeS_LeftStick_Up') || ButtonName == 'Gamepad_LeftStick_Up') || ButtonName == 'XBoxTypeS_RightStick_Up') || ButtonName == 'Gamepad_RightStick_Up') || ButtonName == 'XboxTypeS_DPad_Up') || ButtonName == 'Up')
    {
        // End:0xC8
        if((int(InputEvent) == int(0)) || int(InputEvent) == int(2))
        {
            SelectPrevPlayer();
        }
        return true;        
    }
    else
    {
        // End:0x19A
        if((((((ButtonName == 'XBoxTypeS_LeftStick_Down') || ButtonName == 'Gamepad_LeftStick_Down') || ButtonName == 'XBoxTypeS_RightStick_Down') || ButtonName == 'Gamepad_RightStick_Down') || ButtonName == 'XboxTypeS_DPad_Down') || ButtonName == 'Down')
        {
            // End:0x195
            if((int(InputEvent) == int(0)) || int(InputEvent) == int(2))
            {
                SelectNextPlayer();
            }
            return true;            
        }
        else
        {
            // End:0x1DF
            if(ButtonName == 'XboxTypeS_A')
            {
                // End:0x1DD
                if(int(InputEvent) == int(0))
                {
                    // End:0x1DD
                    if(CanShowSubMenu())
                    {
                        ShowSubMenu(true);
                    }
                }
                return true;
            }
        }
    }
    Retval = false;
    return Retval;
    //return ReturnValue;    
}

function RefreshSelectedPlayer()
{
    ASSetSelectedPlayer(SelectedTeamIndex, SelectedPlayerIndex);
    //return;    
}

function SelectPrevPlayer()
{
    local /*0x97E50000-0x00000000*/ private bool bPromptPrevVisible, bPromptNewVisible;
    local /*0x97E50000-0x00000000*/ private int PrevTeamIndex, PrevPlayerIndex;

    bPromptPrevVisible = CanShowSubMenu();
    PrevTeamIndex = SelectedTeamIndex;
    PrevPlayerIndex = SelectedPlayerIndex;
    // End:0x106
    if((Teams[SelectedTeamIndex].PlayerCount == 0) || ((SelectedTeamIndex == 1) && SelectedPlayerIndex == 0) && Teams[1 - SelectedTeamIndex].PlayerCount > 0)
    {
        SelectedTeamIndex = 1 - SelectedTeamIndex;
        SelectedPlayerIndex = Teams[SelectedTeamIndex].PlayerCount - 1;        
    }
    else
    {
        SelectedPlayerIndex = Clamp(SelectedPlayerIndex - 1, 0, Teams[SelectedTeamIndex].PlayerCount - 1);
    }
    // End:0x1C4
    if((PrevTeamIndex != SelectedTeamIndex) || PrevPlayerIndex != SelectedPlayerIndex)
    {
        RefreshSelectedPlayer();
        bPromptNewVisible = CanShowSubMenu();
        // End:0x1C4
        if(bPromptNewVisible != bPromptPrevVisible)
        {
            ASSetConfirmPromptVisible(bPromptNewVisible);
        }
    }
    //return;    
}

function SelectNextPlayer()
{
    local /*0x97E50000-0x00000000*/ private bool bPromptPrevVisible, bPromptNewVisible;
    local /*0x97E50000-0x00000000*/ private int PrevTeamIndex, PrevPlayerIndex;

    bPromptPrevVisible = CanShowSubMenu();
    PrevTeamIndex = SelectedTeamIndex;
    PrevPlayerIndex = SelectedPlayerIndex;
    // End:0x8B
    if(Teams[SelectedTeamIndex].PlayerCount == 0)
    {
        SelectedTeamIndex = 1 - SelectedTeamIndex;
        SelectedPlayerIndex = 0;        
    }
    else
    {
        // End:0x10A
        if(((SelectedTeamIndex == 0) && SelectedPlayerIndex >= (Teams[0].PlayerCount - 1)) && Teams[1].PlayerCount > 0)
        {
            SelectedTeamIndex = 1;
            SelectedPlayerIndex = 0;            
        }
        else
        {
            SelectedPlayerIndex = Min(SelectedPlayerIndex + 1, Teams[SelectedTeamIndex].PlayerCount - 1);
        }
    }
    // End:0x1C7
    if((PrevTeamIndex != SelectedTeamIndex) || PrevPlayerIndex != SelectedPlayerIndex)
    {
        RefreshSelectedPlayer();
        bPromptNewVisible = CanShowSubMenu();
        // End:0x1C7
        if(bPromptNewVisible != bPromptPrevVisible)
        {
            ASSetConfirmPromptVisible(bPromptNewVisible);
        }
    }
    //return;    
}

function OnLobbyStateChanged()
{
    local /*0x97E50000-0x00000000*/ private byte NewLobbyState[8388609], PrevLobbyState;

    bIsDirty = true;
    Update();
    Render();
    //return;    
}

event OnReceiveFocus()
{
    //return;    
}

event OnRemoveFocus()
{
    //return;    
}

function Render()
{
    local /*0x97E50000-0x00000000*/ private int I;
    local /*0x97E50000-0x00000000*/ private @NULL parentLobby;

    // End:0x11
    if(!bIsDirty)
    {
        return;
    }
    parentLobby = LPGFxFrontEnd_PreGameLobby(RootMC);
    // End:0x65
    if((parentLobby != none) && parentLobby.bIsTopView == false)
    {
        return;
    }
    // End:0xD1
    if((int(MyGRI.LobbyMode) == int(2)) && int(MyGRI.CurrentState) < int(4))
    {
        ASSetNoTeamsModeActive(true);
        RenderNoTeams();        
    }
    else
    {
        ASSetNoTeamsModeActive(false);
        I = 0;
        J0xE7:

        // End:0x120 [Loop If]
        if(I < Teams.Length)
        {
            RenderTeam(I);
            I++;
            // [Loop Continue]
            goto J0xE7;
        }
        RefreshSelectedPlayer();
    }
    bIsDirty = false;
    //return;    
}

function RenderNoTeams()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL PlayerData;
    local /*0x97E50000-0x00000000*/ private int TableIdx, SlotIdx, PlayerIdx, TotalSlots;
    local /*0x97E50000-0x00000000*/ private editfixedsize string InfoString;

    TotalSlots = MaxPlayers * MaxTeams;
    SetTeamNumFields(0, 5);
    SetTeamNumFields(1, TotalSlots - 5);
    TableIdx = 0;
    SlotIdx = 0;
    PlayerIdx = 0;
    J0x64:

    // End:0x264 [Loop If]
    if(PlayerIdx < Teams[0].PlayerCount)
    {
        // End:0xB9
        if((SlotIdx / 5) >= 1)
        {
            TableIdx++;
            SlotIdx = 0;
        }
        PlayerData = Teams[0].Players[PlayerIdx];
        InfoString = ((PlayerData.bIsHost) ? SPGFxMoviePlayer(MoviePlayer).GetLocalizedString("<Strings:LostPlanetGame.LPGFxPreGameLobbySettings.Host>") : "");
        ASSetPlayerData(TableIdx, SlotIdx, PlayerData.PlayerName, PlayerData.MetagamePercent, Class'LPGFxFrontEnd_PartyLobby'.static.GetVoiceStatusFromEnum(PlayerData.VoiceStatus), PlayerData.PingQuality, InfoString, PlayerData.bIsLocalPlayer);
        SlotIdx++;
        PlayerIdx++;
        // [Loop Continue]
        goto J0x64;
    }
    SlotIdx = SlotIdx;
    J0x277:

    // End:0x309 [Loop If]
    if((SlotIdx + (TableIdx * 5)) < TotalSlots)
    {
        // End:0x2C6
        if((SlotIdx / 5) >= 1)
        {
            TableIdx++;
            SlotIdx = 0;
        }
        ASSetPlayerData(TableIdx, SlotIdx, "", -1, "disabled", -1, "", false);
        SlotIdx++;
        // [Loop Continue]
        goto J0x277;
    }
    //return;    
}

function RenderTeam()
{
    local /*0x97E50000-0x00000000*/ private int TeamIndex[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL PlayerData, TeamTable;
    local /*0x97E50000-0x00000000*/ private int I;
    local /*0x97E50000-0x00000000*/ private editfixedsize string InfoString;

    TeamTable = Teams[TeamIndex];
    SetTeamNumFields(TeamIndex, MaxPlayers);
    SetTeamColor(TeamIndex, Class'LPGameMP_Base'.static.GetTeamColor(TeamIndex));
    ASSetTeamName(TeamIndex, Class'LPGameMP_Base'.static.GetTeamName(TeamIndex));
    I = 0;
    J0xBA:

    // End:0x2D1 [Loop If]
    if(I < MaxPlayers)
    {
        // End:0x28E
        if(I < TeamTable.PlayerCount)
        {
            PlayerData = TeamTable.Players[I];
            InfoString = ((PlayerData.bIsHost) ? SPGFxMoviePlayer(MoviePlayer).GetLocalizedString("<Strings:LostPlanetGame.LPGFxPreGameLobbySettings.Host>") : "");
            ASSetPlayerData(TeamIndex, I, PlayerData.PlayerName, PlayerData.MetagamePercent, Class'LPGFxFrontEnd_PartyLobby'.static.GetVoiceStatusFromEnum(PlayerData.VoiceStatus), PlayerData.PingQuality, InfoString, PlayerData.bIsLocalPlayer);            
        }
        else
        {
            ASSetPlayerData(TeamIndex, I, "", -1, "disabled", -1, "", false);
        }
        ++I;
        // [Loop Continue]
        goto J0xBA;
    }
    //return;    
}

function Tick()
{
    Update();
    Render();
    //return;    
}

function Update()
{
    local /*0x97E50000-0x00000000*/ private int I;

    // End:0xD6
    if((int(MyGRI.LobbyMode) == int(2)) && int(MyGRI.CurrentState) < int(4))
    {
        // End:0xC9
        if((Teams.Length == 0) || Teams[0].Players.Length != (MaxPlayers * MaxTeams))
        {
            BuildTeamTable(0, MaxPlayers * MaxTeams);
            bIsDirty = true;
        }
        UpdateNoTeams();        
    }
    else
    {
        // End:0x127
        if((Teams.Length != MaxTeams) || Teams[0].Players.Length != MaxPlayers)
        {
            BuildTeams();
        }
        I = 0;
        J0x132:

        // End:0x16B [Loop If]
        if(I < Teams.Length)
        {
            UpdateTeam(I);
            I++;
            // [Loop Continue]
            goto J0x132;
        }
        // End:0x1A9
        if(SelectedPlayerIndex >= Teams[SelectedTeamIndex].PlayerCount)
        {
            SelectPrevPlayer();
        }
    }
    //return;    
}

function UpdateNoTeams()
{
    local /*0x97E50000-0x00000000*/ private @NULL PRI;
    local /*0x97E50000-0x00000000*/ private int I, J;
    local /*0x97E50000-0x00000000*/ private byte VoiceStatus;
    local /*0x97E50000-0x00000000*/ private int OldPingQuality;

    J = 0;
    I = 0;
    J0x16:

    // End:0x783 [Loop If]
    if(I < MyGRI.PRIArray.Length)
    {
        PRI = LPMenuGamePRI(MyGRI.PRIArray[I]);
        // End:0x90
        if(PRI == none)
        {            
        }
        else
        {
            // End:0x40A
            if(((Teams[0].Players[J].PlayerID != PRI.PlayerID) || Teams[0].Players[J].PlayerName != PRI.PlayerName) || NotEqual_UniqueNetIdUniqueNetId(Teams[0].Players[J].NetId, PRI.UniqueId))
            {
                Teams[0].Players[J].PlayerName = PRI.GetHumanReadableName();
                Teams[0].Players[J].PlayerID = PRI.PlayerID;
                Teams[0].Players[J].NetId = PRI.UniqueId;
                Teams[0].Players[J].PriIndex = I;
                Teams[0].Players[J].Row = J + 1;
                Teams[0].Players[J].bIsLocalPlayer = PRI.IsLocalPRI();
                Teams[0].Players[J].bIsHost = IsPlayerHost(PRI);
                bIsDirty = true;
            }
            // End:0x498
            if(Teams[0].Players[J].PriIndex != I)
            {
                Teams[0].Players[J].PriIndex = I;
            }
            VoiceStatus = Class'LPMultiplayerManager'.static.GetInstance().GetVoiceStatus(PRI.UniqueId);
            // End:0x593
            if(int(Teams[0].Players[J].VoiceStatus) != int(VoiceStatus))
            {
                Teams[0].Players[J].VoiceStatus = VoiceStatus;
                bIsDirty = true;
            }
            // End:0x657
            if(Teams[0].Players[J].MetagamePercent != PRI.MetagamePercent)
            {
                Teams[0].Players[J].MetagamePercent = PRI.MetagamePercent;
                bIsDirty = true;
            }
            OldPingQuality = Teams[0].Players[J].PingQuality;
            Teams[0].Players[J].PingQuality = Class'LPMenuGamePRI'.static.ConvertPRIPing(PRI.Ping);
            // End:0x76A
            if(OldPingQuality != Teams[0].Players[J].PingQuality)
            {
                bIsDirty = true;
            }
            J++;
        }
        I++;
        // [Loop Continue]
        goto J0x16;
    }
    // End:0x7BB
    if(Teams[0].PlayerCount != J)
    {
        bIsDirty = true;
    }
    Teams[0].PlayerCount = J;
    //return;    
}

function UpdateTeam()
{
    local /*0x97E50000-0x00000000*/ private int TeamIndex[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PRI, LPMenuPRI;
    local /*0x97E50000-0x00000000*/ private int I, J, OldPingQuality;
    local /*0x97E50000-0x00000000*/ private byte VoiceStatus;

    J = 0;
    I = 0;
    J0x16:

    // End:0x8DF [Loop If]
    if(I < MyGRI.PRIArray.Length)
    {
        PRI = MyGRI.PRIArray[I];
        LPMenuPRI = LPMenuGamePRI(PRI);
        // End:0xFB
        if((PRI.Team == none) || PRI.Team.TeamIndex != TeamIndex)
        {            
        }
        else
        {
            LPMenuPRI.AddMPPlayerInfoChangedDelegate(OnPlayerInfoChanged);
            // End:0x4F5
            if(((Teams[TeamIndex].Players[J].PlayerID != PRI.PlayerID) || Teams[TeamIndex].Players[J].PlayerName != PRI.PlayerName) || NotEqual_UniqueNetIdUniqueNetId(Teams[TeamIndex].Players[J].NetId, PRI.UniqueId))
            {
                Teams[TeamIndex].Players[J].PlayerName = PRI.GetHumanReadableName();
                Teams[TeamIndex].Players[J].PlayerID = PRI.PlayerID;
                Teams[TeamIndex].Players[J].NetId = PRI.UniqueId;
                Teams[TeamIndex].Players[J].PriIndex = I;
                Teams[TeamIndex].Players[J].Row = J + 1;
                Teams[TeamIndex].Players[J].bIsLocalPlayer = LPMenuPRI.IsLocalPRI();
                Teams[TeamIndex].Players[J].bIsHost = IsPlayerHost(LPMenuPRI);
                bIsDirty = true;
            }
            // End:0x593
            if(Teams[TeamIndex].Players[J].PriIndex != I)
            {
                Teams[TeamIndex].Players[J].PriIndex = I;
            }
            VoiceStatus = Class'LPMultiplayerManager'.static.GetInstance().GetVoiceStatus(PRI.UniqueId);
            // End:0x69E
            if(int(Teams[TeamIndex].Players[J].VoiceStatus) != int(VoiceStatus))
            {
                Teams[TeamIndex].Players[J].VoiceStatus = VoiceStatus;
                bIsDirty = true;
            }
            // End:0x8AC
            if(LPMenuPRI != none)
            {
                // End:0x781
                if(Teams[TeamIndex].Players[J].MetagamePercent != LPMenuPRI.MetagamePercent)
                {
                    Teams[TeamIndex].Players[J].MetagamePercent = LPMenuPRI.MetagamePercent;
                    bIsDirty = true;
                }
                OldPingQuality = Teams[TeamIndex].Players[J].PingQuality;
                Teams[TeamIndex].Players[J].PingQuality = Class'LPMenuGamePRI'.static.ConvertPRIPing(LPMenuPRI.Ping);
                // End:0x8AC
                if(OldPingQuality != Teams[TeamIndex].Players[J].PingQuality)
                {
                    bIsDirty = true;
                }
            }
            J++;
            // End:0x8D1
            if(J >= MaxPlayers)
            {
                // [Explicit Break]
                goto J0x8DF;
            }
        }
        I++;
        // [Loop Continue]
        goto J0x16;
    }
    J0x8DF:

    // End:0x91F
    if(J != Teams[TeamIndex].PlayerCount)
    {
        bIsDirty = true;
    }
    Teams[TeamIndex].PlayerCount = J;
    //return;    
}

function OnPlayerInfoChanged()
{
    local /*0x97E50000-0x00000000*/ private @NULL ChangedPRI[8388609];

    Update();
    Render();
    //return;    
}

function UpdateMaxPlayers()
{
    MaxPlayers = ((int(MyGRI.GameTypeSetting) == int(4)) ? 3 : 5);
    //return;    
}

function IsPlayerHost()
{
    local /*0x97E50000-0x00000000*/ private @NULL PlayerPRI[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x65
    if(((MyGRI != none) && MyGRI.HostPRI != none) && MyGRI.HostPRI == PlayerPRI)
    {
        return true;
    }
    // End:0xC9
    if((int(PlayerPRI.WorldInfo.NetMode) != int(NM_Client)) && PlayerPRI.IsLocalPRI())
    {
        return true;
    }
    return false;
    //return ReturnValue;    
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

function PlayerSelected()
{
    local /*0x97E50000-0x00000000*/ private int TeamIndex[8388609], PlayerIndex;

    SelectedTeamIndex = TeamIndex;
    SelectedPlayerIndex = PlayerIndex;
    // End:0x3E
    if(CanShowSubMenu())
    {
        ShowSubMenu(true);
    }
    //return;    
}

function CanShowSubMenu()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x72
    if((((SelectedTeamIndex < 0) || Teams.Length <= SelectedTeamIndex) || SelectedPlayerIndex < 0) || Teams[SelectedTeamIndex].PlayerCount <= SelectedPlayerIndex)
    {
        return false;
    }
    return true;
    //return ReturnValue;    
}

delegate OnContextMenuVisible()
{
    local /*0x97E50000-0x00000000*/ private bool bVisible[8388609], bIsFriend, bPS3, b360;
    local /*0x97E50000-0x00000000*/ private int OptionIndex, FocusIndex;
    local /*0x97E50000-0x00000000*/ private @NULL SelectedPRI;
    local /*0x97E50000-0x00000000*/ private editfixedsize array Actions;
    local /*0x97E50000-0x00000000*/ private byte A;

    bContextMenuOpen = bVisible;
    FocusIndex = 0;
    // End:0x47A
    if(bVisible)
    {
        bPS3 = Class'Engine.WorldInfo'.static.IsConsoleBuild(2);
        b360 = Class'Engine.WorldInfo'.static.IsConsoleBuild(1);
        SelectedPRI = LPPRI(Class'Engine.WorldInfo'.static.GetWorldInfo().GRI.PRIArray[Teams[SelectedTeamIndex].Players[SelectedPlayerIndex].PriIndex]);
        ContextMenu.InitFromPRI(SelectedPRI);
        bIsFriend = ContextMenu.IsPlayerFriend();
        OptionIndex = 0;
        // End:0x202
        if(SelectedPRI == MoviePlayer.GetPC().PlayerReplicationInfo)
        {
            Actions.AddItem(6);            
            // End:0x1FF
            if(b360 || bPS3)
            {
                Actions.AddItem(5);                
            }            
        }
        else
        {
            // End:0x345
            if(int(Outer.GetPC().WorldInfo.NetMode) == int(NM_Client))
            {
                Actions.AddItem(1);                
                // End:0x297
                if(!bIsFriend && !b360)
                {
                    Actions.AddItem(10);                                        
                }
                else
                {
                    // End:0x2C6
                    if(!b360 && !bPS3)
                    {
                        Actions.AddItem(11);                        
                    }
                }
                Actions.AddItem(6);                
                // End:0x300
                if(b360 || bPS3)
                {
                    Actions.AddItem(5);                    
                }
                // End:0x342
                if(ContextMenu.OptionInfo[0].bIsDisabled)
                {
                    FocusIndex = 1;
                }                
            }
            else
            {
                Actions.AddItem(4);                
                Actions.AddItem(1);                
                // End:0x395
                if(!bIsFriend && !b360)
                {
                    Actions.AddItem(10);                                        
                }
                else
                {
                    // End:0x3C4
                    if(!b360 && !bPS3)
                    {
                        Actions.AddItem(11);                        
                    }
                }
                Actions.AddItem(6);                
                // End:0x3FE
                if(b360 || bPS3)
                {
                    Actions.AddItem(5);                    
                }
            }
        }
        SetSubMenuNumOptions(Actions.Length);
        // End:0x44E
        foreach Actions(A, OptionIndex)
        {
            SetSubMenuOptionType(OptionIndex, A);            
        }        
        ContextMenu.SetFocusedOption(FocusIndex);        
    }
    else
    {
        ASSetSelectedPlayer(SelectedTeamIndex, SelectedPlayerIndex);
    }
    ASSetButtonPromptsVisible(!bVisible);
    //return;    
}

function ASSetNoTeamsModeActive()
{
    local /*0x97E50000-0x00000000*/ private bool bIsActive[8388609];

    RootMC.ActionScriptVoid("setNoTeamsModeActive");
    //return;    
}

defaultproperties
{
    MaxPlayers=5
    MaxTeams=2
}