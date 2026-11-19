class LPGFxMoviePlayerScoreboard extends SPGFxMoviePlayer
    config(UI);

struct PlayerTableInfo
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private int Row;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string PlayerName;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL NetId;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte VoiceStatus;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private int Column1Count;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private int Column2Count;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private int Column3Count;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bHighlight;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bAlive;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL LPP;

    structdefaultproperties
    {
        Row=0
        PlayerName=""
        NetId=(Uid=(Data=none,Data[1]=none,Data[2]=none,Data[3]=none,Data[4]=none,Data[5]=none,Data[6]=none,Data[7]=none))
        VoiceStatus=PlayerVoiceStatus.ePlayerVoiceStatus_Enabled
        Column1Count=0
        Column2Count=0
        Column3Count=0
        bHighlight=false
        bAlive=false
        LPP=none
    }
};

struct TeamTableInfo
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private int TeamIndex;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private int PlayerCount;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private int TeamScore;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array Players;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TeamColor;

    structdefaultproperties
    {
        TeamIndex=0
        PlayerCount=0
        TeamScore=0
        Players=none
        TeamColor=(R=0,G=0,B=0,A=0)
    }
};

var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array Teams;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MyWorldInfo[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MyGRI[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL myLPHUD[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL RootMC;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int MaxPlayers;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int SecondsRemaining;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bShowRespawnInfo;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bShowTableFooter;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bUpdatingPaused;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bReadyToRespawn;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bScoreboardConstructed;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bRespawnInfoConstructed;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int MyTeamIndex;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte GameType;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL RespawnTimer;
//var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> __ComparePlayerScores__Delegate;

function Start()
{
    local /*0x97E50000-0x00000000*/ private bool StartPaused[9437185], ReturnValue, bStart;

    false
    bStart = super.Start(StartPaused);
    SetImageSubstitutions();
    ClearCaptureKeys();
    return bStart;
    //return ReturnValue;    
}

delegate ComparePlayerScores()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL A[8388609], B;
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];

    // End:0x51
    if(A.PlayerName == "")
    {
        // End:0x4B
        if(B.PlayerName == "")
        {
            return 0;            
        }
        else
        {
            return -1;
        }
    }
    // End:0x76
    if(B.PlayerName == "")
    {
        return 1;
    }
    // End:0xA2
    if(A.Column3Count <= -1000)
    {
        return -1;
    }
    // End:0x13B
    if(int(GameType) == int(3))
    {
        // End:0xFC
        if(A.Column1Count < B.Column1Count)
        {
            return -1;            
        }
        else
        {
            // End:0x13B
            if(A.Column1Count > B.Column1Count)
            {
                return 1;
            }
        }
    }
    // End:0x17E
    if(A.Column3Count < B.Column3Count)
    {
        return -1;
    }
    return 1;
    //return ReturnValue;    
}

function ConstructScoreboard()
{
    local /*0x97E50000-0x00000000*/ private @NULL W[8388609];
    local /*0x97E50000-0x00000000*/ private int CallerTeamIndex[8388609], TeamIndex;

    // End:0x0F
    if(bScoreboardConstructed)
    {
        return;
    }
    MyWorldInfo = W;
    MyGRI = LPGRI_Base_MP(W.GRI);
    MyTeamIndex = CallerTeamIndex;
    myLPHUD = LPHUD(Outer);
    GameType = MyGRI.GameType;
    RootMC = GetVariableObject("_root");
    RespawnTimer = GetVariableObject("startCounter");
    bShowTableFooter = MyGRI.Teams.Length > 1;
    TeamIndex = 0;
    J0x121:

    // End:0x152 [Loop If]
    if(TeamIndex < 2)
    {
        ConstructTeam(TeamIndex);
        ++TeamIndex;
        // [Loop Continue]
        goto J0x121;
    }
    ShowScoreboard(true);
    bScoreboardConstructed = true;
    //return;    
}

function ConstructTeam()
{
    local /*0x97E50000-0x00000000*/ private int TeamIndex[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL TeamTable;
    local /*0x97E50000-0x00000000*/ private int Players;
    local /*0x97E50000-0x00000000*/ private @NULL PRI, Row, TeamColor, OwningPC;
    local /*0x97E50000-0x00000000*/ private bool bIsOwnTeam;
    local /*0x97E50000-0x00000000*/ private @NULL DefaultNetId;

    OwningPC = GetPC();
    bIsOwnTeam = int(OwningPC.GetTeamNum()) == TeamIndex;
    TeamTable.TeamIndex = TeamIndex;
    TeamTable.PlayerCount = 0;
    Players = 0;
    J0x9A:

    // End:0x211 [Loop If]
    if(Players < MaxPlayers)
    {
        Row.Row = Players;
        Row.PlayerName = "";
        Row.NetId = DefaultNetId;
        Row.VoiceStatus = 1;
        Row.Column1Count = -1000;
        Row.Column2Count = -1000;
        Row.Column3Count = 0;
        Row.bAlive = false;
        Row.LPP = none;
        TeamTable.Players.AddItem(Row);        
        ++Players;
        // [Loop Continue]
        goto J0x9A;
    }
    Players = 0;
    J0x21C:

    // End:0x6B2 [Loop If]
    if(Players < MyGRI.PRIArray.Length)
    {
        PRI = LPPRI(MyGRI.PRIArray[Players]);
        // End:0x296
        if(PRI == none)
        {            
        }
        else
        {
            // End:0x2EC
            if(PRI.bBot || !ClassIsChildOf(PRI.PawnClass, Class'LPBasePlayerPawn'))
            {                
            }
            else
            {
                // End:0x6A4
                if((PRI.Team != none) && PRI.Team.TeamIndex == TeamIndex)
                {
                    Row.Row = TeamTable.PlayerCount;
                    Row.NetId = PRI.UniqueId;
                    Row.PlayerName = PRI.PlayerName;
                    Row.VoiceStatus = ((bIsOwnTeam) ? Class'LPMultiplayerManager'.static.GetInstance().GetVoiceStatus(PRI.UniqueId) : 1);
                    Row.Column1Count = PRI.HumanKillCount;
                    Row.Column2Count = PRI.GetMPCreditsEarnedInRound();
                    Row.Column3Count = int(PRI.Score);
                    Row.bHighlight = PRI.IsLocalPRI();
                    Row.LPP = MyGRI.FindPawnFromPRIID(PRI.PlayerID);
                    Row.bAlive = ((Row.LPP != none) ? Row.LPP.IsAliveAndWell() : false);
                    TeamTable.Players[TeamTable.PlayerCount] = Row;
                    ++TeamTable.PlayerCount;
                }
            }
        }
        ++Players;
        // [Loop Continue]
        goto J0x21C;
    }
    SetTeamNumPlayers(TeamIndex, TeamTable.PlayerCount);    
    TeamTable.Players.Sort(ComparePlayerScores);    
    Players = 0;
    J0x726:

    // End:0x8C2 [Loop If]
    if(Players < TeamTable.PlayerCount)
    {
        Row = TeamTable.Players[Players];
        // End:0x8B4
        if(Row.PlayerName != "")
        {
            SetPlayerData(TeamIndex, Players, Row.PlayerName, -1, Class'LPGFxFrontEnd_PartyLobby'.static.GetVoiceStatusFromEnum(Row.VoiceStatus), -1, string(Row.Column1Count), string(Row.Column2Count), string(Row.Column3Count), Row.bHighlight, Row.bAlive);
        }
        ++Players;
        // [Loop Continue]
        goto J0x726;
    }
    SetTeamName(TeamIndex, Class'LPGameMP_Base'.static.GetTeamName(TeamIndex));
    SetScoreboardGameType("Scenario");
    SetTeamGoalText(TeamIndex, GetLocalizedString("<Strings:LostPlanetGame.LPGFxMoviePlayerScoreboard.ScenarioGoal>"));
    TeamTable.TeamScore = LPTeamInfo_MP(MyGRI.Teams[TeamIndex]).TeamCredits;
    SetTeamGoalValue(TeamIndex, string(TeamTable.TeamScore));
    TeamColor = Class'LPGameMP_Base'.static.GetTeamColor(TeamIndex);
    SetTeamColor(TeamIndex, float(TeamColor.R), float(TeamColor.G), float(TeamColor.B));
    QueryDataProviders();
    Teams[TeamIndex] = TeamTable;
    //return;    
}

function UpdateTables()
{
    local /*0x97E50000-0x00000000*/ private int TeamIndex;

    // End:0x0F
    if(bUpdatingPaused)
    {
        return;
    }
    // End:0x44
    if((MyWorldInfo == none) || MyWorldInfo.IsInSeamlessTravel())
    {
        return;
    }
    TeamIndex = 0;
    J0x4F:

    // End:0x88 [Loop If]
    if(TeamIndex < Teams.Length)
    {
        UpdateTeam(TeamIndex);
        ++TeamIndex;
        // [Loop Continue]
        goto J0x4F;
    }
    //return;    
}

function GetPRIFromNetId()
{
    local /*0x97E50000-0x00000000*/ private @NULL NetId[8388609], ReturnValue;
    local /*0x97E50000-0x00000000*/ private int Players;

    Players = 0;
    J0x0B:

    // End:0xCB [Loop If]
    if(Players < MyGRI.PRIArray.Length)
    {
        // End:0xBD
        if(EqualEqual_UniqueNetIdUniqueNetId(MyGRI.PRIArray[Players].UniqueId, NetId))
        {
            return LPPRI(MyGRI.PRIArray[Players]);
        }
        ++Players;
        // [Loop Continue]
        goto J0x0B;
    }
    return none;
    //return ReturnValue;    
}

function GetIndexOfNetIdInTeam()
{
    local /*0x97E50000-0x00000000*/ private int TeamIndex[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL NetId[8388609];
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689], Players;

    Players = 0;
    J0x0B:

    // End:0xB1 [Loop If]
    if(Players < Teams[TeamIndex].Players.Length)
    {
        // End:0xA3
        if(EqualEqual_UniqueNetIdUniqueNetId(Teams[TeamIndex].Players[Players].NetId, NetId))
        {
            return Players;
        }
        ++Players;
        // [Loop Continue]
        goto J0x0B;
    }
    return -1;
    //return ReturnValue;    
}

function UpdateTeam()
{
    local /*0x97E50000-0x00000000*/ private int TeamIndex[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL TI;
    local /*0x97E50000-0x00000000*/ private int NewPlayerCount, Players;
    local /*0x97E50000-0x00000000*/ private @NULL PRI;
    local /*0x97E50000-0x00000000*/ private int FoundIndex;
    local /*0x97E50000-0x00000000*/ private bool bPlayerUpdated, bTeamUpdated;
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL PTI;
    local /*0x97E50000-0x00000000*/ private int TeamScore;
    local /*0x97E50000-0x00000000*/ private bool bAlive;
    local /*0x97E50000-0x00000000*/ private @NULL LPPPawn, OwningPC;
    local /*0x97E50000-0x00000000*/ private bool bIsOwnTeam;
    local /*0x97E50000-0x00000000*/ private @NULL DefaultNetId;

    OwningPC = GetPC();
    bIsOwnTeam = int(OwningPC.GetTeamNum()) == TeamIndex;
    TI = Teams[TeamIndex];
    Players = 0;
    J0x73:

    // End:0x193 [Loop If]
    if(Players < MyGRI.PRIArray.Length)
    {
        PRI = LPPRI(MyGRI.PRIArray[Players]);
        // End:0xED
        if(PRI == none)
        {            
        }
        else
        {
            // End:0x185
            if(((PRI.Team != none) && PRI.Team.TeamIndex == TeamIndex) && !PRI.bBot)
            {
                ++NewPlayerCount;
            }
        }
        ++Players;
        // [Loop Continue]
        goto J0x73;
    }
    bTeamUpdated = false;
    // End:0x927
    if((NewPlayerCount > TI.PlayerCount) && NewPlayerCount <= MaxPlayers)
    {
        Players = 0;
        J0x1ED:

        // End:0x91B [Loop If]
        if(Players < MyGRI.PRIArray.Length)
        {
            PRI = LPPRI(MyGRI.PRIArray[Players]);
            // End:0x267
            if(PRI == none)
            {                
            }
            else
            {
                // End:0x90D
                if((((PRI.Team != none) && PRI.Team.TeamIndex == TeamIndex) && !PRI.bBot) && ClassIsChildOf(PRI.PawnClass, Class'LPBasePlayerPawn'))
                {
                    FoundIndex = GetIndexOfNetIdInTeam(TeamIndex, PRI.UniqueId);
                    // End:0x90D
                    if(FoundIndex < 0)
                    {
                        TI.Players[TI.PlayerCount].Column1Count = PRI.HumanKillCount;
                        TI.Players[TI.PlayerCount].Column2Count = PRI.DeathCount;
                        TI.Players[TI.PlayerCount].Column3Count = PRI.GetMPCreditsEarnedInRound();
                        // End:0x52F
                        if(int(GameType) == int(4))
                        {
                            TI.Players[TI.PlayerCount].Column1Count += PRI.NonHumanKillCount;
                        }
                        TI.Players[TI.PlayerCount].NetId = PRI.UniqueId;
                        TI.Players[TI.PlayerCount].PlayerName = PRI.PlayerName;
                        TI.Players[TI.PlayerCount].bHighlight = PRI.IsLocalPRI();
                        TI.Players[TI.PlayerCount].VoiceStatus = ((bIsOwnTeam) ? Class'LPMultiplayerManager'.static.GetInstance().GetVoiceStatus(PRI.UniqueId) : 1);
                        TI.Players[TI.PlayerCount].Row = -1;
                        TI.Players[TI.PlayerCount].LPP = MyGRI.FindPawnFromPRI(PRI);
                        TI.Players[TI.PlayerCount].bAlive = ((TI.Players[TI.PlayerCount].LPP != none) ? TI.Players[TI.PlayerCount].LPP.IsAliveAndWell() : false);
                        ++TI.PlayerCount;
                    }
                }
            }
            ++Players;
            // [Loop Continue]
            goto J0x1ED;
        }
        bTeamUpdated = true;
    }    
    TI.Players.Sort(ComparePlayerScores);    
    TeamScore = LPTeamInfo_MP(MyGRI.Teams[TeamIndex]).TeamCredits;
    Players = 0;
    J0x9BC:

    // End:0x16A4 [Loop If]
    if(Players < TI.PlayerCount)
    {
        bPlayerUpdated = false;
        PRI = GetPRIFromNetId(TI.Players[Players].NetId);
        // End:0x11FB
        if((PRI != none) && int(PRI.GetTeamNum()) == TeamIndex)
        {
            // End:0xAA6
            if(PRI.PawnClass == none)
            {
                // [Explicit Continue]
                goto J0x1696;
            }
            PTI = TI.Players[Players];
            PTI.Column1Count = PRI.HumanKillCount;
            PTI.Column2Count = PRI.DeathCount;
            PTI.Column3Count = PRI.GetMPCreditsEarnedInRound();
            PTI.VoiceStatus = ((bIsOwnTeam) ? Class'LPMultiplayerManager'.static.GetInstance().GetVoiceStatus(PRI.UniqueId) : 1);
            // End:0xC59
            if(int(GameType) == int(4))
            {
                PTI.Column1Count += PRI.NonHumanKillCount;
            }
            LPPPawn = MyGRI.FindPawnFromPRI(PRI);
            // End:0xD10
            if(LPPPawn != PTI.LPP)
            {
                TI.Players[Players].LPP = LPPPawn;
                bPlayerUpdated = true;
                bTeamUpdated = true;
            }
            // End:0xDD2
            if(LPPPawn != none)
            {
                bAlive = LPPPawn.IsAliveAndWell();
                // End:0xDD2
                if(bAlive != PTI.bAlive)
                {
                    TI.Players[Players].bAlive = bAlive;
                    bPlayerUpdated = true;
                    bTeamUpdated = true;
                }
            }
            // End:0xE81
            if(PRI.PlayerName != PTI.PlayerName)
            {
                TI.Players[Players].PlayerName = PRI.PlayerName;
                bPlayerUpdated = true;
                bTeamUpdated = true;
            }
            // End:0xF49
            if(PTI.Column1Count != TI.Players[Players].Column1Count)
            {
                TI.Players[Players].Column1Count = PTI.Column1Count;
                bPlayerUpdated = true;
                bTeamUpdated = true;
            }
            // End:0x1011
            if(PTI.Column2Count != TI.Players[Players].Column2Count)
            {
                TI.Players[Players].Column2Count = PTI.Column2Count;
                bPlayerUpdated = true;
                bTeamUpdated = true;
            }
            // End:0x10D9
            if(PTI.Column3Count != TI.Players[Players].Column3Count)
            {
                TI.Players[Players].Column3Count = PTI.Column3Count;
                bPlayerUpdated = true;
                bTeamUpdated = true;
            }
            // End:0x1138
            if(Players != TI.Players[Players].Row)
            {
                bPlayerUpdated = true;
                bTeamUpdated = true;
            }
            // End:0x11F8
            if(int(PTI.VoiceStatus) != int(TI.Players[Players].VoiceStatus))
            {
                TI.Players[Players].VoiceStatus = PTI.VoiceStatus;
                bPlayerUpdated = true;
            }            
        }
        else
        {
            // End:0x120D
            if(PRI == none)
            {                
            }
            else
            {
                // End:0x123F
                if(int(PRI.GetTeamNum()) != TeamIndex)
                {                    
                }
            }
            TI.Players[Players].Column1Count = -1000;
            TI.Players[Players].Column2Count = -1;
            TI.Players[Players].Column3Count = -1000;
            TI.Players[Players].NetId = DefaultNetId;
            TI.Players[Players].PlayerName = "";
            TI.Players[Players].VoiceStatus = 1;
            TI.Players[Players].bHighlight = false;
            TI.Players[Players].bAlive = false;
            TI.Players[Players].LPP = none;
        }
        TI.Players[Players].Row = Players;
        // End:0x1696
        if(bPlayerUpdated)
        {
            SetPlayerData(TeamIndex, Players, TI.Players[Players].PlayerName, -1, Class'LPGFxFrontEnd_PartyLobby'.static.GetVoiceStatusFromEnum(TI.Players[Players].VoiceStatus), -1, string(TI.Players[Players].Column1Count), string(TI.Players[Players].Column2Count), string(TI.Players[Players].Column3Count), TI.Players[Players].bHighlight, TI.Players[Players].bAlive);
        }
        J0x1696:

        ++Players;
        // [Loop Continue]
        goto J0x9BC;
    }
    // End:0x17C4
    if(((bShowTableFooter && bTeamUpdated) || TI.TeamScore != TeamScore) || TI.PlayerCount != NewPlayerCount)
    {
        TI.TeamScore = TeamScore;
        TI.PlayerCount = NewPlayerCount;
        SetTeamNumPlayers(TeamIndex, TI.PlayerCount);
        SetTeamGoalValue(TeamIndex, string(TI.TeamScore));
    }
    Teams[TeamIndex] = TI;
    //return;    
}

function LogPlayerList()
{
    local /*0x97E50000-0x00000000*/ private int I, J;

    I = 0;
    J0x0B:

    // End:0x7F [Loop If]
    if(I < Teams.Length)
    {
        J = 0;
        J0x2E:

        // End:0x71 [Loop If]
        if(J < Teams[I].Players.Length)
        {
            J++;
            // [Loop Continue]
            goto J0x2E;
        }
        I++;
        // [Loop Continue]
        goto J0x0B;
    }
    //return;    
}

function ConstructRespawnInfo()
{
    local /*0x97E50000-0x00000000*/ private int InitialCounterValue[8388609];

    // End:0x0F
    if(bRespawnInfoConstructed)
    {
        return;
    }
    SecondsRemaining = InitialCounterValue;
    bShowRespawnInfo = InitialCounterValue > 0;
    bCaptureInput = bShowRespawnInfo;
    ShowRespawnPrompt(false);
    ShowRespawnTimer(bShowRespawnInfo);
    SetRespawnTimer(InitialCounterValue);
    SetRespawnText(GetLocalizedString("<Strings:LostPlanetGame.LPGFxMoviePlayerScoreboard.RespawnIn>"));
    ShowLoadoutPrompt(bShowRespawnInfo);
    SetLoadoutPromptText(GetLocalizedString("<Strings:LostPlanetGame.LPGFxMoviePlayerScoreboard.ConfigureLoadout>"));
    bReadyToRespawn = false;
    bRespawnInfoConstructed = true;
    //return;    
}

function DecrementRespawnCounter()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL LPPC;

    // End:0x11
    if(!bShowRespawnInfo)
    {
        return true;
    }
    SecondsRemaining -= 1;
    LPPC = LPPlayerController(GetPC());
    // End:0x8E
    if(LPPC.myLPHUD.IsPauseMenuOpen())
    {
        // End:0x8E
        if(SecondsRemaining <= 0)
        {
            bReadyToRespawn = true;
            return false;
        }
    }
    // End:0xB3
    if(SecondsRemaining > 0)
    {
        SetRespawnTimer(SecondsRemaining);        
    }
    else
    {
        // End:0xE4
        if(SecondsRemaining <= 0)
        {
            SecondsRemaining = 0;
            bReadyToRespawn = true;
            ShowRespawnPrompts(true);
        }
    }
    // End:0xFB
    if(bReadyToRespawn)
    {
        HandleRespawn();
    }
    return SecondsRemaining <= 0;
    //return ReturnValue;    
}

function HandleRespawn()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPG;

    LPG = LPGRI_Base_MP(Class'Engine.WorldInfo'.static.GetWorldInfo().GRI);
    // End:0x87
    if((LPG != none) && LPG.bAutoRespawnOnDeath)
    {
        CloseScoreboard(false, true);
    }
    //return;    
}

function ChildIsClosing()
{
    local /*0x97E50000-0x00000000*/ private @NULL Child[8388609], MovieHUD;

    MovieHUD = myLPHUD.MyLPGFxMovie;
    bAllowFocus = true;
    bUpdatingPaused = false;
    // End:0x84
    if(MovieHUD.MyLPGFxMovie_MunitionsLocker != none)
    {
        MovieHUD.MyLPGFxMovie_MunitionsLocker = none;
    }
    //return;    
}

function CloseScoreboard()
{
    local /*0x97E50000-0x00000000*/ private bool bImmediateClose[9437185], bForceClose, ReturnValue;
    local /*0x97E50000-0x00000000*/ private @NULL OwningPC, LPPC;

    false
    true
    // End:0x2C
    if(!bForceClose && !CanCloseScoreboard())
    {
        return false;
    }
    bRespawnInfoConstructed = false;
    bUpdatingPaused = false;
    OwningPC = GetPC();
    // End:0xF8
    if(OwningPC != none)
    {
        LPPC = LPPlayerController(OwningPC);
        // End:0xF8
        if(LPPC != none)
        {
            // End:0xCD
            if(!bShowRespawnInfo)
            {
                LPPC.CloseRoundScoreboard(bImmediateClose);                
            }
            else
            {
                LPPC.CloseRespawnScoreboard(bImmediateClose);
            }
            return true;
        }
    }
    return false;
    //return ReturnValue;    
}

function ShowRespawnPrompts()
{
    local /*0x97E50000-0x00000000*/ private bool bShow[9437185];

    true
    ShowRespawnPrompt(false);
    ShowLoadoutPrompt(bShow);
    //return;    
}

event FilterButtonInput()
{
    local /*0x97E50000-0x00000000*/ private int ControllerId[8388609];
    local /*0x97E50000-0x00000000*/ private name ButtonName[8388609];
    local /*0x97E50000-0x00000000*/ private byte InputEvent[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL LPPC;

    // End:0xA6
    if((ButtonName == 'XboxTypeS_Start') && int(InputEvent) == int(0))
    {
        LPPC = LPPlayerController(GetPC());
        // End:0xA4
        if(!LPPC.myLPHUD.IsPauseMenuOpen())
        {
            LPPC.ConditionalPauseGame();
            return true;
        }
        return false;
    }
    // End:0x128
    if((((ButtonName == 'XboxTypeS_Y') || ButtonName == 'Two') && int(InputEvent) == int(0)) && bShowRespawnInfo)
    {
        bUpdatingPaused = true;
        myLPHUD.OpenPauseMenuKits();
        return true;
    }
    return false;
    //return ReturnValue;    
}

function CanCloseScoreboard()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL OwningPC;

    OwningPC = GetPC();
    return (((OwningPC != none) && !OwningPC.IsInState('Dead')) && !OwningPC.IsInState('RoundEnded')) && !bShowRespawnInfo || bReadyToRespawn;
    //return ReturnValue;    
}

function ConstructSpawnQueuePrompt()
{
    //return;    
}

function RemoveRespawnInfo()
{
    ShowRespawnPrompts(false);
    ShowRespawnTimer(false);
    SecondsRemaining = 0;
    bShowRespawnInfo = false;
    bCaptureInput = false;
    bReadyToRespawn = false;
    //return;    
}

function OnPauseMenuVisible()
{
    local /*0x97E50000-0x00000000*/ private bool bVisible[8388609];

    ShowScoreboard(!bVisible);
    ShowRespawnPrompts(!bVisible && SecondsRemaining > 0);
    // End:0x65
    if(!bVisible && bReadyToRespawn)
    {
        HandleRespawn();
    }
    //return;    
}

function ShowScoreboard()
{
    local /*0x97E50000-0x00000000*/ private bool bShow[8388609];

    RootMC.ActionScriptVoid("showScoreboard");
    //return;    
}

function SetTeamColor()
{
    local /*0x97E50000-0x00000000*/ private int TeamNum[8388609];
    local /*0x97E50000-0x00000000*/ private float R[8388609], G, B;

    RootMC.ActionScriptVoid("setTeamColor");
    //return;    
}

function SetTeamGoalText()
{
    local /*0x97E50000-0x00000000*/ private int TeamNum[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize string GoalText[8388609];

    RootMC.ActionScriptVoid("setTeamGoalText");
    //return;    
}

function SetTeamGoalValue()
{
    local /*0x97E50000-0x00000000*/ private int TeamNum[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize string Value[8388609];

    RootMC.ActionScriptVoid("setTeamGoalValue");
    //return;    
}

function SetTeamName()
{
    local /*0x97E50000-0x00000000*/ private int TeamNum[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize string Value[8388609];

    RootMC.ActionScriptVoid("setTeamName");
    //return;    
}

function SetTeamNumPlayers()
{
    local /*0x97E50000-0x00000000*/ private int TeamNum[8388609], NumPlayers;

    RootMC.ActionScriptVoid("setTeamNumFields");
    //return;    
}

function SetScoreboardGameType()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string ScoreboardGameType[8388609];

    RootMC.ActionScriptVoid("setScoreboardGameType");
    //return;    
}

function SetPlayerData()
{
    local /*0x97E50000-0x00000000*/ private int TeamNum[8388609], Index;
    local /*0x97E50000-0x00000000*/ private editfixedsize string PlayerName[8388609];
    local /*0x97E50000-0x00000000*/ private int Rank[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize string ChatStatus[8388609];
    local /*0x97E50000-0x00000000*/ private int playerPing[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize string Column1[8388609], Column2, Column3;
    local /*0x97E50000-0x00000000*/ private bool bHighlight[8388609], bAlive;

    RootMC.ActionScriptVoid("setPlayerData");
    //return;    
}

function ShowLoadoutPrompt()
{
    local /*0x97E50000-0x00000000*/ private bool bShow[8388609];

    RootMC.ActionScriptVoid("showLoadoutPrompt");
    //return;    
}

function SetLoadoutPromptText()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string Text[8388609];

    RootMC.ActionScriptVoid("setLoadoutPromptText");
    //return;    
}

function ShowRespawnPrompt()
{
    local /*0x97E50000-0x00000000*/ private bool bShow[8388609];

    RootMC.ActionScriptVoid("showRespawnPrompt");
    //return;    
}

function SetRespawnPromptText()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string Text[8388609];

    RootMC.ActionScriptVoid("setRespawnPromptText");
    //return;    
}

function ShowRespawnTimer()
{
    local /*0x97E50000-0x00000000*/ private bool bShow[8388609];

    RespawnTimer.SetVisible(bShow);
    RootMC.ActionScriptVoid("showRespawnTimer");
    //return;    
}

function SetRespawnTimer()
{
    local /*0x97E50000-0x00000000*/ private int Time[8388609];

    RootMC.ActionScriptVoid("setRespawnTimer");
    //return;    
}

function SetRespawnText()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string Text[8388609];

    RootMC.ActionScriptVoid("setRespawnText");
    //return;    
}

function SetScoreboardBackplateOpaque()
{
    local /*0x97E50000-0x00000000*/ private bool bOpaque[8388609];

    // End:0x17
    if(bOpaque)
    {
        SetBackgroundToBlack();
    }
    //return;    
}

function SetBackgroundToBlack()
{
    RootMC.ActionScriptVoid("SetBackgroundToBlack");
    //return;    
}

function QueryDataProviders()
{
    RootMC.ActionScriptVoid("queryDataProviders");
    //return;    
}

defaultproperties
{
    MaxPlayers=5
    ImageSubstitutions=/* Array type was not detected. */
}