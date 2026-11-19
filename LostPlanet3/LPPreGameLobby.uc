class LPPreGameLobby extends LPMenuGame
    config(Game)
    hidecategories(AnimDependency,Navigation,Movement,Collision);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string LobbyMode;

event InitGame()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string Options[8388609], ErrorMessage;

    super.InitGame(Options, ErrorMessage);
    // End:0x65
    if(HasOption(Options, "LobbyMode"))
    {
        LobbyMode = ParseOption(Options, "LobbyMode");
    }
    //return;    
}

function InitGameReplicationInfo()
{
    local /*0x97E50000-0x00000000*/ private @NULL GRI, MPMgr;

    super.InitGameReplicationInfo();
    MPMgr = Class'LPMultiplayerManager'.static.GetInstance();
    GRI = LPPreGameLobbyGRI(GameReplicationInfo);
    // End:0x19C
    if(GRI != none)
    {
        // End:0x98
        if(LobbyMode == "Custom")
        {
            GRI.LobbyMode = 1;            
        }
        else
        {
            // End:0xD6
            if(LobbyMode == "QuickMatch")
            {
                GRI.LobbyMode = 2;                
            }
            else
            {
                GRI.LobbyMode = ((MPMgr.bIsQuickMatch) ? 2 : 1);
            }
        }
        GRI.OnlineMode = MPMgr.OnlineMode;
        GRI.bNetDirty = true;
        GRI.bForceNetUpdate = true;
    }
    InitOnlineGame();
    //return;    
}

function InitOnlineGame()
{
    local /*0x97E50000-0x00000000*/ private @NULL GameSettings, GRI;

    GRI = LPPreGameLobbyGRI(GameReplicationInfo);
    // End:0x69
    if((GRI == none) || !Class'LPMultiplayerManager'.static.GetInstance().IsInGame())
    {
        return;
    }
    GameSettings = GetCurrentGameSettings();
    GRI.MatchGameDifficultySetting = GameSettings.GetMatchGameDifficulty();
    GRI.bAllowFriendlyFireSetting = GameSettings.GetAllowFriendlyFire();
    GRI.GameTypeSetting = byte(GameSettings.GetGameType());
    GRI.RoundsToWinSetting = GameSettings.GetRoundsToWin();
    GRI.ScoreLimitSetting = GameSettings.GetScoreLimit();
    GRI.TimeLimitSetting = GameSettings.GetTimeLimit();
    GRI.SetLobbyState(1);
    GRI.UpdateOnlineGame();
    //return;    
}

function InitTeamMuteList()
{
    local /*0x97E50000-0x00000000*/ private @NULL PC[8388609];

    //return;    
}

function CheckAllPlayersReady()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL PC, PRI;

    // End:0xB1
    foreach WorldInfo.AllControllers(Class'Engine.PlayerController', PC)
    {
        // End:0xB0
        if(!PC.IsLocalPlayerController())
        {
            PRI = LPPreGameLobbyPRI(PC.PlayerReplicationInfo);
            // End:0xB0
            if(!PRI.bReady)
            {                
                return false;
            }
        }        
    }    
    return true;
    //return ReturnValue;    
}

function RegisterRecentPlayers()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize array Players;
    local /*0x97E50000-0x00000000*/ private @NULL P, PlayersList;
    local /*0x97E50000-0x00000000*/ private int TeamNum;
    local /*0x97E50000-0x00000000*/ private @NULL PC;
    local /*0x97E50000-0x00000000*/ private int PlayerIndex;
    local /*0x97E50000-0x00000000*/ private @NULL PlayerPRI;

    PlayersList = OnlineRecentPlayersList(OnlineSub.GetNamedInterface('RecentPlayersList'));
    // End:0x1FB
    if(((PlayersList != none) && WorldInfo != none) && WorldInfo.GRI != none)
    {
        PlayerIndex = 0;
        J0x8C:

        // End:0x1D3 [Loop If]
        if(PlayerIndex < WorldInfo.GRI.PRIArray.Length)
        {
            P.NetId = WorldInfo.GRI.PRIArray[PlayerIndex].UniqueId;
            P.TeamNum = int(WorldInfo.GRI.PRIArray[PlayerIndex].GetTeamNum());
            Players.AddItem(P);            
            PlayerIndex++;
            // [Loop Continue]
            goto J0x8C;
        }
        PlayersList.SetCurrentPlayersList(Players);
    }
    // End:0x350
    foreach WorldInfo.AllControllers(Class'LPPreGameLobbyPC', PC)
    {
        TeamNum = int(PC.GetTeamNum());
        PlayerPRI = LPPRI(PC.PlayerReplicationInfo);
        PC.PickedTeamNum = TeamNum;
        // End:0x34F
        if(Class'LPGameViewportClient'.static.IsTGSDemo())
        {
            PC.DesiredNevecPawnClassName = PlayerPRI.DesiredNevecPawnClassName;
            PC.DesiredPiratePawnClassName = PlayerPRI.DesiredPiratePawnClassName;
        }        
    }    
    //return;    
}

function RegisterServer()
{
    super(SPGameInfo).RegisterServer();
    // End:0x3D
    if(int(WorldInfo.NetMode) == int(NM_DedicatedServer))
    {
        InitOnlineGame();
    }
    //return;    
}

function BeginMatch()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string LaunchURL;
    local /*0x97E50000-0x00000000*/ private @NULL MPMgr, PGGRI;
    local /*0x97E50000-0x00000000*/ private int GameDiffINT;

    // End:0x16
    if(int(Role) != int(ROLE_Authority))
    {
        return;
    }
    MPMgr = Class'LPMultiplayerManager'.static.GetInstance();
    PGGRI = LPPreGameLobbyGRI(WorldInfo.GRI);
    LaunchURL = PGGRI.WinningMapName;
    switch(PGGRI.GameTypeSetting)
    {
        // End:0xE9
        case 1:            
            LaunchURL $= "?game=EXTR";
            // End:0x166
            break;
        // End:0x112
        case 2:            
            LaunchURL $= "?game=SCEN";
            // End:0x166
            break;
        // End:0x13A
        case 3:            
            LaunchURL $= "?game=TDM";
            // End:0x166
            break;
        // End:0x163
        case 4:            
            LaunchURL $= "?game=SURV";
            // End:0x166
            break;
        // End:0xFFFF
        default:
            break;
    }
    GameDiffINT = int(PGGRI.MatchGameDifficultySetting);    
    LaunchURL $= ("?MatchGameDifficulty=" $ string(GameDiffINT));    
    LaunchURL $= ("?FriendlyFire=" $ string(PGGRI.bAllowFriendlyFireSetting));    
    LaunchURL $= ("?RoundsToWin=" $ string(PGGRI.RoundsToWinSetting));    
    LaunchURL $= ("?ScoreLimit=" $ string(PGGRI.ScoreLimitSetting));    
    LaunchURL $= ("?TimeLimit=" $ string(PGGRI.TimeLimitSetting));
    RegisterRecentPlayers();
    // End:0x3D9
    if(MPMgr.bChooseOptimalHost && int(MPMgr.OnlineMode) != int(2))
    {
        MPMgr.ServerTravelToOptimalHost();
        // End:0x3D6
        if(NotEqual_UniqueNetIdUniqueNetId(MPMgr.OptimalHostPlayerId, GameInterface.GetGameSettings(MPMgr.SessionNameGame).OwningPlayerId))
        {
            return;
        }        
    }
    else
    {
        Class'LPMPMapList'.static.ShowMapGameSpecificLoadingMovie(PGGRI.WinningMapName, PGGRI.GameTypeSetting);
        WorldInfo.ServerTravel(LaunchURL);
    }
    //return;    
}

event PostLogin()
{
    local /*0x97E50000-0x00000000*/ private @NULL NewPlayer[8388609], GRI, LPPC, GameSettings;
    local /*0x97E50000-0x00000000*/ private byte GameType;
    local /*0x97E50000-0x00000000*/ private @NULL MPManager;

    super.PostLogin(NewPlayer);
    GRI = LPPreGameLobbyGRI(WorldInfo.GRI);
    LPPC = LPPlayerController(NewPlayer);
    // End:0x22C
    if(int(Role) == int(ROLE_Authority))
    {
        // End:0x1CB
        if(LPPC.IsLocalController())
        {
            MPManager = Class'LPMultiplayerManager'.static.GetInstance();
            GameSettings = LPOnlineGameSettings(MPManager.GetDataStoreGameSettings().GetCurrentGameSettings());
            GameType = byte(GameSettings.GetGameType());
            GRI.SetGameTypeSetting(GameType);
            // End:0x1A7
            if(int(GRI.LobbyMode) == int(2))
            {
                GRI.SetLobbyState(2);                
            }
            else
            {
                GRI.SetLobbyState(3);
            }            
        }
        else
        {
            // End:0x22C
            if(int(GRI.LobbyMode) == int(2))
            {
                // End:0x22C
                if(NumPlayers >= MaxPlayers)
                {
                    GRI.SetLobbyState(3);
                }
            }
        }
    }
    // End:0x262
    if(NumPlayers > MaxPlayers)
    {
        LPPC.ClientGameFullError();
    }
    //return;    
}

event PostSeamlessTravel()
{
    local /*0x97E50000-0x00000000*/ private @NULL GRI;

    super(SPGameMP_Base).PostSeamlessTravel();
    GRI = LPPreGameLobbyGRI(WorldInfo.GRI);
    // End:0x11A
    if(int(Role) == int(ROLE_Authority))
    {
        // End:0x87
        if(int(GRI.GameTypeSetting) == int(4))
        {
            MaxPlayers = 6;            
        }
        else
        {
            MaxPlayers = 10;
        }
        // End:0xF9
        if((int(GRI.LobbyMode) == int(2)) && NumPlayers < MaxPlayers)
        {
            GRI.SetLobbyState(2);            
        }
        else
        {
            GRI.SetLobbyState(3);
        }
    }
    //return;    
}

event Login()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string Portal[8388609], Options;
    local /*0x97E50000-0x00000000*/ private @NULL UniqueId[8519681];
    local /*0x97E50000-0x00000000*/ private editfixedsize string ErrorMessage[25165825];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], PC, GRI;

    PC = LPPlayerController(super(SPGameMP_Base).Login(Portal, Options, UniqueId, ErrorMessage));
    PlacePlayerOnSmallestTeam(PC);
    GRI = LPPreGameLobbyGRI(WorldInfo.GRI);
    // End:0xDB
    if(((GRI != none) && int(GRI.LobbyMode) != int(2)) && !AreTeamSizesValid())
    {
        RebalanceTeams();
    }
    Class'LPMultiplayerManager'.static.GetInstance().UpdatePlayerCounts(Class'LPMultiplayerManager'.static.GetInstance().SessionNameGame);
    return PC;
    //return ReturnValue;    
}

function Logout()
{
    local /*0x97E50000-0x00000000*/ private @NULL Exiting[8388609], PC;

    super(GameInfo).Logout(Exiting);
    PC = LPPlayerController(Exiting);
    // End:0x5D
    if(PC != none)
    {
        PC.SendPartyMembersBackToParty();
    }
    // End:0xB9
    if(!AreTeamsBalanced(1, int(Exiting.GetTeamNum())))
    {
        RebalanceTeams(int(Exiting.GetTeamNum()));
    }
    Class'LPMultiplayerManager'.static.GetInstance().UpdatePlayerCounts(Class'LPMultiplayerManager'.static.GetInstance().SessionNameGame);
    //return;    
}

function AttemptMissingPlayerReservation()
{
    local /*0x97E50000-0x00000000*/ private @NULL PC[8388609];
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL MPMgr, ZeroId;
    local /*0x97E50000-0x00000000*/ private editfixedsize array PartyMembers;

    MPMgr = Class'LPMultiplayerManager'.static.GetInstance();
    PartyMembers.Length = 1;
    PartyMembers[0].NetId = PC.PlayerReplicationInfo.UniqueId;
    PartyMembers[0].Skill = int(LPPRI(PC.PlayerReplicationInfo).PlayerRank);
    // End:0x313
    if(NotEqual_UniqueNetIdUniqueNetId(LPPRI(PC.PlayerReplicationInfo).PartyOwnerUniqueId, ZeroId))
    {
        // End:0x22C
        if(MPMgr.HostReservationBeacon.GetExistingReservation(LPPRI(PC.PlayerReplicationInfo).PartyOwnerUniqueId) != -1)
        {
            MPMgr.HostReservationBeacon.UpdatePartyReservationEntry(LPPRI(PC.PlayerReplicationInfo).PartyOwnerUniqueId, PartyMembers);            
        }
        else
        {
            MPMgr.HostReservationBeacon.AddPartyReservationEntry(LPPRI(PC.PlayerReplicationInfo).PartyOwnerUniqueId, PartyMembers, -1, false);
        }
        return MPMgr.HostReservationBeacon.GetTeamForCurrentPlayer(PC.PlayerReplicationInfo.UniqueId);
    }
    return -1;
    //return ReturnValue;    
}

function ReconcileBeaconTeamAssignments()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

function GetNumPlayersOnTeam()
{
    local /*0x97E50000-0x00000000*/ private int TeamNbr[8388609], ReturnValue, I, Count;

    Count = 0;
    I = 0;
    J0x16:

    // End:0x9E [Loop If]
    if(I < Teams[TeamNbr].TeamMembers.Length)
    {
        // End:0x90
        if(Teams[TeamNbr].TeamMembers[I] != none)
        {
            Count++;
        }
        I++;
        // [Loop Continue]
        goto J0x16;
    }
    return Count;
    //return ReturnValue;    
}

function CopyTeam()
{
    local /*0x97E50000-0x00000000*/ private int TeamNbr[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize array Team[25165825];
    local /*0x97E50000-0x00000000*/ private int I;

    Team.Length = 0;
    I = 0;
    J0x17:

    // End:0xD3 [Loop If]
    if(I < Teams[TeamNbr].TeamMembers.Length)
    {
        // End:0xC5
        if(Teams[TeamNbr].TeamMembers[I] != none)
        {
            Team.AddItem(Teams[TeamNbr].TeamMembers[I]);            
        }
        I++;
        // [Loop Continue]
        goto J0x17;
    }
    //return;    
}

function AreTeamsBalanced()
{
    local /*0x97E50000-0x00000000*/ private int Delta[9437185], DepartingTeamNum;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private int Team0Size, Team1Size;

    1
    -1
    Team0Size = GetNumPlayersOnTeam(0);
    Team1Size = GetNumPlayersOnTeam(1);
    switch(DepartingTeamNum)
    {
        // End:0x5D
        case 0:
            Team0Size--;
            // End:0x72
            break;
        // End:0x6F
        case 1:
            Team1Size--;
            // End:0x72
            break;
        // End:0xFFFF
        default:
            break;
    }
    // End:0x9C
    if(Abs(float(Team0Size - Team1Size)) > float(Delta))
    {
        return false;
    }
    return true;
    //return ReturnValue;    
}

function AreTeamSizesValid()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private int Team0Size, Team1Size;

    Team0Size = GetNumPlayersOnTeam(0);
    Team1Size = GetNumPlayersOnTeam(1);
    // End:0x44
    if(Team0Size > (GetMaxTeamSize()))
    {
        return false;
    }
    // End:0x5E
    if(Team1Size > (GetMaxTeamSize()))
    {
        return false;
    }
    return true;
    //return ReturnValue;    
}

function GetMaxTeamSize()
{
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL PGGRI;
    local /*0x97E50000-0x00000000*/ private int MaxPlayersPerTeam;

    PGGRI = LPPreGameLobbyGRI(WorldInfo.GRI);
    MaxPlayersPerTeam = 5;
    // End:0x81
    if(PGGRI != none)
    {
        // End:0x81
        if(int(PGGRI.GameTypeSetting) == int(4))
        {
            MaxPlayersPerTeam = 3;
        }
    }
    return MaxPlayersPerTeam;
    //return ReturnValue;    
}

function PlacePlayerOnSmallestTeam()
{
    local /*0x97E50000-0x00000000*/ private @NULL NewPlayer[8388609];
    local /*0x97E50000-0x00000000*/ private int Team0Size, Team1Size, SmallestTeam;

    Team0Size = GetNumPlayersOnTeam(0);
    Team1Size = GetNumPlayersOnTeam(1);
    // End:0x4F
    if(Team0Size <= Team1Size)
    {
        SmallestTeam = 0;        
    }
    else
    {
        SmallestTeam = 1;
    }
    ChangeTeam(NewPlayer, SmallestTeam, false);
    //return;    
}

event HandleSeamlessTravelPlayer()
{
    local /*0x97E50000-0x00000000*/ private @NULL C[25165825], LPPC, GRI;

    super.HandleSeamlessTravelPlayer(C);
    LPPC = LPPlayerController(C);
    // End:0x51
    if(LPPC != none)
    {
        PlacePlayerOnSmallestTeam(LPPC);
    }
    // End:0x1A6
    if(int(Role) == int(ROLE_Authority))
    {
        GRI = LPPreGameLobbyGRI(WorldInfo.GRI);
        // End:0xCE
        if(int(GRI.GameTypeSetting) == int(4))
        {
            MaxPlayers = 6;            
        }
        else
        {
            MaxPlayers = 10;
        }
        // End:0x140
        if((int(GRI.LobbyMode) == int(2)) && NumPlayers < MaxPlayers)
        {
            GRI.SetLobbyState(2);            
        }
        else
        {
            GRI.SetLobbyState(3);
            // End:0x1A6
            if((int(GRI.LobbyMode) != int(2)) && !AreTeamSizesValid())
            {
                RebalanceTeams();
            }
        }
    }
    //return;    
}

function ShuffleTeams()
{
    local /*0x97E50000-0x00000000*/ private int I, Team0Count, Team1Count;
    local /*0x97E50000-0x00000000*/ private editfixedsize array Team0, Team1;
    local /*0x97E50000-0x00000000*/ private int RandomIndex;

    CopyTeam(0, Team0);
    CopyTeam(1, Team1);
    Team0Count = Team0.Length;
    Team1Count = Team1.Length;
    // End:0x7B
    if(Abs(float(Team0Count - Team1Count)) > float(1))
    {
        RebalanceTeams();
    }
    // End:0x9D
    if((Team0Count < 1) || Team1Count < 1)
    {
        return;
    }
    I = 0;
    J0xA8:

    // End:0x189 [Loop If]
    if(I < Team0Count)
    {
        // End:0x17B
        if(Rand(100) < 50)
        {
            ChangeTeam(PlayerController(Team0[I]), 1, false);
            RandomIndex = Rand(Team1.Length);
            // End:0x12B
            if(RandomIndex >= Team1.Length)
            {
                RandomIndex = 0;
            }
            ChangeTeam(PlayerController(Team1[RandomIndex]), 0, false);
            CopyTeam(0, Team0);
            CopyTeam(1, Team1);
        }
        I++;
        // [Loop Continue]
        goto J0xA8;
    }
    //return;    
}

function RebalanceTeams()
{
    local /*0x97E50000-0x00000000*/ private int DepartingTeamNum[9437185], I, Team0Count, Team1Count, NumToTransfer;

    local /*0x97E50000-0x00000000*/ private editfixedsize array Team0, Team1;
    local /*0x97E50000-0x00000000*/ private @NULL Temp;
    local /*0x97E50000-0x00000000*/ private int SwapIndex, IdealTeamSize;

    -1
    CopyTeam(0, Team0);
    CopyTeam(1, Team1);
    Team0Count = Team0.Length;
    Team1Count = Team1.Length;
    switch(DepartingTeamNum)
    {
        // End:0x7E
        case 0:
            Team0Count--;
            // End:0x93
            break;
        // End:0x90
        case 1:
            Team1Count--;
            // End:0x93
            break;
        // End:0xFFFF
        default:
            break;
    }
    // End:0xB5
    if(Abs(float(Team0Count - Team1Count)) <= float(1))
    {
        return;
    }
    IdealTeamSize = (Team0Count + Team1Count) / 2;
    // End:0x239
    if(Team0Count > Team1Count)
    {
        NumToTransfer = Team0Count - IdealTeamSize;
        // End:0x135
        if(((Team0Count + Team1Count) % 2) == 1)
        {
            NumToTransfer--;
        }
        I = 0;
        J0x140:

        // End:0x1DE [Loop If]
        if(I < NumToTransfer)
        {
            Temp = Team0[I];
            SwapIndex = Rand(Team0Count - 1);
            Team0[I] = Team0[SwapIndex];
            Team0[SwapIndex] = Temp;
            I++;
            // [Loop Continue]
            goto J0x140;
        }
        I = 0;
        J0x1E9:

        // End:0x236 [Loop If]
        if(I < NumToTransfer)
        {
            ChangeTeam(PlayerController(Team0[I]), 1, false);
            I++;
            // [Loop Continue]
            goto J0x1E9;
        }        
    }
    else
    {
        NumToTransfer = Team1Count - IdealTeamSize;
        // End:0x280
        if(((Team0Count + Team1Count) % 2) == 1)
        {
            NumToTransfer--;
        }
        I = 0;
        J0x28B:

        // End:0x329 [Loop If]
        if(I < NumToTransfer)
        {
            Temp = Team1[I];
            SwapIndex = Rand(Team1Count - 1);
            Team1[I] = Team1[SwapIndex];
            Team1[SwapIndex] = Temp;
            I++;
            // [Loop Continue]
            goto J0x28B;
        }
        I = 0;
        J0x334:

        // End:0x381 [Loop If]
        if(I < NumToTransfer)
        {
            ChangeTeam(PlayerController(Team1[I]), 0, false);
            I++;
            // [Loop Continue]
            goto J0x334;
        }
    }
    //return;    
}

function UpdateOnlineGame()
{
    local /*0x97E50000-0x00000000*/ private @NULL GRI;

    GRI = LPPreGameLobbyGRI(WorldInfo.GRI);
    GRI.UpdateOnlineGame();
    //return;    
}

defaultproperties
{
    NumTeams=2
    // Reference: SPAIVisibilityManager'Default__LPPreGameLobby.VisMan0'
    begin object name=VisMan0
    end object
    AIVisMan=VisMan0
    bUseSeamlessTravel=true
    PlayerControllerClass=Class'LPPreGameLobbyPC'
    PlayerReplicationInfoClass=Class'LPPreGameLobbyPRI'
    GameReplicationInfoClass=Class'LPPreGameLobbyGRI'
}