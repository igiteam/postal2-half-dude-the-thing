class PlayerReplicationInfo extends ReplicationInfo
    nativereplication
    notplaceable
    hidecategories(AnimDependency,Navigation,Movement,Collision);

struct native AutomatedTestingDatum
{
    var(*) /*0x35EA0000-0x00000000*/ private int NumberOfMatchesPlayed;
    var(*) /*0x35EA0000-0x00000000*/ private int NumMapListCyclesDone;

    structdefaultproperties
    {
        NumberOfMatchesPlayed=0
        NumMapListCyclesDone=0
    }
};

var(*) /*0x35EA0000-0x00000000*/ private travel float Score[2097153];
var(*) /*0x35EA0000-0x00000000*/ private int Deaths[2097153];
var(*) /*0x35EA0000-0x00000000*/ private byte Ping[2097153];
var(*) /*0x35EA0000-0x00000000*/ private byte TTSSpeaker[536870913];
var(*) /*0x35EA0000-0x00000000*/ private int NumLives;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize travel string PlayerName[2097153];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string OldName;
var(*) /*0x35EA0000-0x00000000*/ private int PlayerID[2097153];
var(*) /*0x35EA0000-0x00000400*/ private travel TeamInfo Team[2097153];
var(*) /*0x35EA0000-0x00000000*/ private bool bAdmin[2097153];
var(*) /*0x35EA0000-0x00000000*/ private bool bIsSpectator[2097153];
var(*) /*0x35EA0000-0x00000000*/ private bool bOnlySpectator[2097153];
var(*) /*0x35EA0000-0x00000000*/ private bool bWaitingPlayer[2097153];
var(*) /*0x35EA0000-0x00000000*/ private bool bReadyToPlay[2097153];
var(*) /*0x35EA0000-0x00000000*/ private bool bOutOfLives[2097153];
var(*) /*0x35EA0000-0x00000000*/ private bool bBot[2097153];
var(*) /*0x35EA0000-0x00000000*/ private bool bHasBeenWelcomed;
var(*) /*0x35EA0000-0x00000000*/ private travel bool bIsInactive[2097153];
var(*) /*0x35EA0000-0x00000000*/ private bool bFromPreviousLevel[2097153];
var(*) /*0x35EA0000-0x00000000*/ private int StartTime[2097153];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string StringSpectating;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string StringUnknown;
var(*) /*0x35EA0000-0x00000000*/ private int Kills;
var(*) /*0x35EA0000-0x00000000*/ private class GameMessageClass;
var(*) /*0x35EA0000-0x00000000*/ private float ExactPing;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string SavedNetworkAddress;
var(*) /*0x35EA0000-0x00000000*/ private travel UniqueNetId UniqueId[2097153];
var(*) /*0x35EA0000-0x00000000*/ private name SessionName[131073];
var(*) /*0x35EA0000-0x00000000*/ private @NULL AutomatedTestingData;
var(*) /*0x35EA0000-0x00000000*/ private int StatConnectionCounts;
var(*) /*0x35EA0000-0x00000000*/ private int StatPingTotals;
var(*) /*0x35EA0000-0x00000000*/ private int StatPingMin;
var(*) /*0x35EA0000-0x00000000*/ private int StatPingMax;
var(*) /*0x35EA0000-0x00000000*/ private int StatPKLTotal;
var(*) /*0x35EA0000-0x00000000*/ private int StatPKLMin;
var(*) /*0x35EA0000-0x00000000*/ private int StatPKLMax;
var(*) /*0x35EA0000-0x00000000*/ private int StatMaxInBPS;
var(*) /*0x35EA0000-0x00000000*/ private int StatAvgInBPS;
var(*) /*0x35EA0000-0x00000000*/ private int StatMaxOutBPS;
var(*) /*0x35EA0000-0x00000000*/ private int StatAvgOutBPS;
var(*) /*0x35EA0000-0x00000000*/ private @NULL Avatar[536870913];

simulated event PostBeginPlay()
{
    // End:0x59
    if(WorldInfo.GRI != none)
    {
        WorldInfo.GRI.AddPRI(self);
    }
    // End:0x6F
    if(int(Role) < int(ROLE_Authority))
    {
        return;
    }
    // End:0x93
    if(AIController(Owner) != none)
    {
        bBot = true;
    }
    StartTime = WorldInfo.GRI.ElapsedTime;
    //return;    
}

simulated function ClientInitialize()
{
    local /*0x35EA0000-0x00000000*/ private @NULL C[8388609], A, PlayerOwner;

    SetOwner(C);
    PlayerOwner = PlayerController(C);
    // End:0x88
    if(PlayerOwner != none)
    {
        // End:0x88
        if(Team != default.Team)
        {
            // End:0x87
            foreach AllActors(Class'Actor', A)
            {
                A.NotifyLocalPlayerTeamReceived();                
            }            
        }
    }
    //return;    
}

function SetPlayerTeam()
{
    local /*0x35EA0000-0x00000000*/ private @NULL NewTeam[8388609];

    bForceNetUpdate = Team != NewTeam;
    Team = NewTeam;
    //return;    
}

simulated event ReplicatedEvent()
{
    local /*0x35EA0000-0x00000000*/ private name VarName[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL P, PC;
    local /*0x35EA0000-0x00000000*/ private int WelcomeMessageNum;
    local /*0x35EA0000-0x00000000*/ private @NULL A, ZeroId;

    // End:0xFD
    if(VarName == 'Team')
    {
        // End:0x77
        foreach DynamicActors(Class'Pawn', P)
        {
            // End:0x76
            if(P.PlayerReplicationInfo == self)
            {
                P.NotifyTeamChanged();
                // End:0x77
                break;
            }            
        }        
        // End:0xF9
        foreach LocalPlayerControllers(Class'PlayerController', PC)
        {
            // End:0xF8
            if(PC.PlayerReplicationInfo == self)
            {
                // End:0xF4
                foreach AllActors(Class'Actor', A)
                {
                    A.NotifyLocalPlayerTeamReceived();                    
                }                
                // End:0xF9
                break;
            }            
        }                
    }
    else
    {
        // End:0x283
        if(VarName == 'PlayerName')
        {
            // End:0x123
            if(IsInvalidName())
            {
                return;
            }
            // End:0x16B
            if(WorldInfo.TimeSeconds < float(2))
            {
                bHasBeenWelcomed = true;
                OldName = PlayerName;
                return;
            }
            // End:0x1D7
            if(bHasBeenWelcomed)
            {
                // End:0x1D4
                if(ShouldBroadCastWelcomeMessage())
                {
                    // End:0x1D3
                    foreach LocalPlayerControllers(Class'PlayerController', PC)
                    {
                        PC.ReceiveLocalizedMessage(GameMessageClass, 2, self);                        
                    }                    
                }                
            }
            else
            {
                // End:0x1F3
                if(bOnlySpectator)
                {
                    WelcomeMessageNum = 16;                    
                }
                else
                {
                    WelcomeMessageNum = 1;
                }
                bHasBeenWelcomed = true;
                // End:0x26D
                if(ShouldBroadCastWelcomeMessage())
                {
                    // End:0x26C
                    foreach LocalPlayerControllers(Class'PlayerController', PC)
                    {
                        PC.ReceiveLocalizedMessage(GameMessageClass, WelcomeMessageNum, self);                        
                    }                    
                }
            }
            OldName = PlayerName;            
        }
        else
        {
            // End:0x2C6
            if(VarName == 'UniqueId')
            {
                // End:0x2C3
                if(NotEqual_UniqueNetIdUniqueNetId(UniqueId, ZeroId))
                {
                    RegisterPlayerWithSession();
                }                
            }
            else
            {
                // End:0x347
                if(VarName == 'bIsInactive')
                {
                    WorldInfo.GRI.RemovePRI(self);
                    WorldInfo.GRI.AddPRI(self);
                }
            }
        }
    }
    //return;    
}

// Export UPlayerReplicationInfo::execUpdatePing(FFrame&, void* const)
native final function UpdatePing()
{
    local /*0x35EA0000-0x00000000*/ private float TimeStamp[8388609];


}

simulated function ShouldBroadCastWelcomeMessage()
{
    local /*0x35EA0000-0x00000000*/ private bool bExiting[9437185], ReturnValue;

    return !bIsInactive && int(WorldInfo.NetMode) != int(NM_Standalone);
    //return ReturnValue;    
}

simulated event Destroyed()
{
    local /*0x35EA0000-0x00000000*/ private @NULL PC, ZeroId;

    // End:0x59
    if(WorldInfo.GRI != none)
    {
        WorldInfo.GRI.RemovePRI(self);
    }
    // End:0xB5
    if(ShouldBroadCastWelcomeMessage(true))
    {
        // End:0xB4
        foreach LocalPlayerControllers(Class'PlayerController', PC)
        {
            PC.ReceiveLocalizedMessage(GameMessageClass, 4, self);            
        }        
    }
    // End:0xDE
    if(NotEqual_UniqueNetIdUniqueNetId(UniqueId, ZeroId))
    {
        UnregisterPlayerFromSession();
    }
    super(Actor).Destroyed();
    //return;    
}

function Reset()
{
    super(Actor).Reset();
    Score = 0.0000000;
    Kills = 0;
    Deaths = 0;
    bReadyToPlay = false;
    NumLives = 0;
    bOutOfLives = false;
    bForceNetUpdate = true;
    //return;    
}

simulated function GetHumanReadableName()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string ReturnValue[92274689];

    return PlayerName;
    //return ReturnValue;    
}

simulated function DisplayDebug()
{
    local /*0x35EA0000-0x00000000*/ private @NULL HUD[8388609];
    local /*0x35EA0000-0x00000000*/ private float YL[25165825], YPos, XS, YS;

    // End:0x4D
    if(Team == none)
    {
        HUD.Canvas.SetDrawColor(255, 255, 0);        
    }
    else
    {
        // End:0xAF
        if(Team.TeamIndex == 0)
        {
            HUD.Canvas.SetDrawColor(255, 0, 0);            
        }
        else
        {
            HUD.Canvas.SetDrawColor(64, 64, 255);
        }
    }
    HUD.Canvas.SetPos(4.0000000, YPos);
    HUD.Canvas.Font = Class'Engine'.static.GetSmallFont();
    HUD.Canvas.StrLen(PlayerName, XS, YS);
    HUD.Canvas.DrawText(PlayerName);
    HUD.Canvas.SetPos(4.0000000 + XS, YPos);
    HUD.Canvas.Font = Class'Engine'.static.GetTinyFont();
    HUD.Canvas.SetDrawColor(255, 255, 0);
    YPos += YS;
    HUD.Canvas.SetPos(4.0000000, YPos);
    // End:0x52C
    if((PlayerController(Owner) != none) && PlayerController(HUD.Owner).ViewTarget != PlayerController(HUD.Owner).Pawn)
    {
        HUD.Canvas.SetDrawColor(128, 128, 255);
        HUD.Canvas.DrawText((((((((("      bIsSpec:" @ string(bIsSpectator)) @ "OnlySpec:") $ string(bOnlySpectator)) @ "Waiting:") $ string(bWaitingPlayer)) @ "Ready:") $ string(bReadyToPlay)) @ "OutOfLives:") $ string(bOutOfLives));
        YPos += YL;
        HUD.Canvas.SetPos(4.0000000, YPos);
    }
    //return;    
}

event SetPlayerName()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string S[8388609];

    PlayerName = S;
    // End:0x7A
    if((int(WorldInfo.NetMode) == int(NM_Standalone)) || int(WorldInfo.NetMode) == int(NM_ListenServer))
    {
        ReplicatedEvent('PlayerName');
    }
    OldName = PlayerName;
    bForceNetUpdate = true;
    //return;    
}

function SetWaitingPlayer()
{
    local /*0x35EA0000-0x00000000*/ private bool B[8388609];

    bIsSpectator = B;
    bWaitingPlayer = B;
    bForceNetUpdate = true;
    //return;    
}

function Duplicate()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689], NewPRI;

    NewPRI = Spawn(Class);
    CopyProperties(NewPRI);
    return NewPRI;
    //return ReturnValue;    
}

function OverrideWith()
{
    local /*0x35EA0000-0x00000000*/ private @NULL PRI[8388609];

    bIsSpectator = PRI.bIsSpectator;
    bOnlySpectator = PRI.bOnlySpectator;
    bWaitingPlayer = PRI.bWaitingPlayer;
    bReadyToPlay = PRI.bReadyToPlay;
    bOutOfLives = PRI.bOutOfLives || bOutOfLives;
    Team = PRI.Team;
    //return;    
}

function CopyProperties()
{
    local /*0x35EA0000-0x00000000*/ private @NULL PRI[8388609];

    PRI.Score = Score;
    PRI.Deaths = Deaths;
    PRI.Ping = Ping;
    PRI.NumLives = NumLives;
    PRI.PlayerName = PlayerName;
    PRI.PlayerID = PlayerID;
    PRI.StartTime = StartTime;
    PRI.Kills = Kills;
    PRI.bOutOfLives = bOutOfLives;
    PRI.SavedNetworkAddress = SavedNetworkAddress;
    PRI.Team = Team;
    PRI.UniqueId = UniqueId;
    PRI.AutomatedTestingData = AutomatedTestingData;
    //return;    
}

function IncrementDeaths()
{
    local /*0x35EA0000-0x00000000*/ private int Amt[9437185];

    1
    Deaths += Amt;
    //return;    
}

function SeamlessTravelTo()
{
    local /*0x35EA0000-0x00000000*/ private @NULL NewPRI[8388609];

    CopyProperties(NewPRI);
    NewPRI.bOnlySpectator = bOnlySpectator;
    //return;    
}

simulated function SetUniqueId()
{
    local /*0x35EA0000-0x00000000*/ private @NULL PlayerUniqueId[8388609];

    UniqueId = PlayerUniqueId;
    //return;    
}

// Export UPlayerReplicationInfo::execGetTeamNum(FFrame&, void* const)
native simulated function GetTeamNum()
{
    local /*0x35EA0000-0x00000000*/ private byte ReturnValue[92274689];


}

simulated function IsInvalidName()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x35EA0000-0x00000000*/ private @NULL LocPlayer, PC;
    local /*0x35EA0000-0x00000000*/ private editfixedsize string ProfileName;
    local /*0x35EA0000-0x00000000*/ private @NULL OnlineSub;

    OnlineSub = Class'GameEngine'.static.GetOnlineSubsystem();
    // End:0x211
    if(OnlineSub != none)
    {
        PC = PlayerController(Owner);
        // End:0x211
        if(PC != none)
        {
            LocPlayer = LocalPlayer(PC.Player);
            // End:0x211
            if(((LocPlayer != none) && NotEqual_InterfaceInterface(OnlineSub.GameInterface, OnlineGameInterface(none))) && NotEqual_InterfaceInterface(OnlineSub.PlayerInterface, OnlinePlayerInterface(none)))
            {
                // End:0x211
                if(int(OnlineSub.PlayerInterface.GetLoginStatus(byte(LocPlayer.ControllerId))) == int(2))
                {
                    ProfileName = OnlineSub.PlayerInterface.GetPlayerNickname(byte(LocPlayer.ControllerId));
                    // End:0x211
                    if(ProfileName != PlayerName)
                    {
                        PC.SetName(ProfileName);
                        return true;
                    }
                }
            }
        }
    }
    return false;
    //return ReturnValue;    
}

simulated function RegisterPlayerWithSession()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Online, PlayersList, ZeroId;

    // End:0x1C5
    if(NotEqual_UniqueNetIdUniqueNetId(UniqueId, ZeroId))
    {
        Online = Class'GameEngine'.static.GetOnlineSubsystem();
        // End:0x1C2
        if(Online != none)
        {
            // End:0x1BF
            if(NotEqual_InterfaceInterface(Online.GameInterface, OnlineGameInterface(none)))
            {
                // End:0x1BC
                if(SessionName != 'None')
                {
                    // End:0x1B9
                    if(Online.GameInterface.GetGameSettings(SessionName) != none)
                    {
                        Online.GameInterface.RegisterPlayer(SessionName, UniqueId, false);
                        // End:0x1B6
                        if(!bNetOwner)
                        {
                            PlayersList = OnlineRecentPlayersList(Online.GetNamedInterface('RecentPlayersList'));
                            // End:0x1B3
                            if(PlayersList != none)
                            {
                                PlayersList.AddPlayerToRecentPlayers(UniqueId);                                
                            }                            
                        }                        
                    }                    
                }                
            }            
        }        
    }
    //return;    
}

simulated function UnregisterPlayerFromSession()
{
    local /*0x35EA0000-0x00000000*/ private @NULL OnlineSub, ZeroId;

    // End:0x1DC
    if((NotEqual_UniqueNetIdUniqueNetId(UniqueId, ZeroId) && int(WorldInfo.NetMode) == int(NM_Client)) && SessionName != 'None')
    {
        OnlineSub = Class'GameEngine'.static.GetOnlineSubsystem();
        // End:0x1D9
        if((((OnlineSub != none) && NotEqual_InterfaceInterface(OnlineSub.GameInterface, OnlineGameInterface(none))) && OnlineSub.GameInterface.GetGameSettings(SessionName) != none) && !WorldInfo.PeerHostMigration.bHostMigrationEnabled && int(WorldInfo.PeerHostMigration.HostMigrationProgress) != int(0))
        {
            OnlineSub.GameInterface.UnregisterPlayer(SessionName, UniqueId);            
        }        
    }
    //return;    
}

simulated function IsPrimaryPlayer()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

defaultproperties
{
    StringSpectating="Spectating"
    StringUnknown="Unknown"
    GameMessageClass=Class'GameMessage'
    SessionName="Game"
    TickGroup=ETickingGroup.TG_DuringAsyncWork
    NetUpdateFrequency=1.0000000
}