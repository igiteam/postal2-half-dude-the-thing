class LPGameMP_Base extends SPGameMP_Base
    abstract
    config(Game)
    hidecategories(AnimDependency,Navigation,Movement,Collision);

const PROPERTY_FRIENDLYFIRE = 0x1000000A;
const PROPERTY_MAPNAME = 0x1000000B;
const PROPERTY_MATCHDIFFICULTY = 0x1000000C;
const PROPERTY_ROUNDSTOWIN = 0x1000000D;
const PROPERTY_SCORELIMIT = 0x1000000E;
const PROPERTY_TIMELIMIT = 0x1000000F;
const PROPERTY_MATCHSTATE = 0x10000010;
const PROPERTY_SCORELEFT = 0x10000011;
const PROPERTY_TIMELEFT = 0x10000012;
const PROPERTY_GAMETYPE = 0x10000013;
const PROPERTY_INVITEMODE = 0x10000014;
const PROPERTY_SESSIONTYPE = 0x10000015;
const PROPERTY_AVAIL_TEAM_SIZE = 0x10000016;
const PROPERTY_AVGPLAYERSKILL = 0x10000017;
const PROPERTY_REQUIRED_DLC = 0x1000003E;
const PROPERTY_INSTALLED_DLC = 0x1000003F;
const PROPERTY_TENGRUSHWINS = 0x20000002;
const PROPERTY_TENGCOLLECTED = 0x20000003;
const PROPERTY_TDMWINS = 0x20000004;
const PROPERTY_SCENARIO_WINS = 0x20000005;
const PROPERTY_CREDITS = 0x20000006;
const PROPERTY_PLAYTIME = 0x20000007;
const PROPERTY_REVIVALS = 0x20000008;
const PROPERTY_KILLS = 0x20000009;
const PROPERTY_SURVIVALWINS = 0x2000003D;
const SESSION_MATCH_QUERY_ALL = 0;
const SESSION_MATCH_QUERY_EXTRACTION = 2;
const SESSION_MATCH_QUERY_SCENARIO = 3;
const SESSION_MATCH_QUERY_TEAMDEATHMATCH = 4;
const SESSION_MATCH_QUERY_PARTY = 5;
const SESSION_MATCH_QUERY_SURVIVAL = 6;
const SESSION_MATCH_QUERY_ALL_DLCEXACT = 7;
const SESSION_MATCH_QUERY_ALL_DLCANY = 8;
const SESSION_MATCH_QUERY_EXTRACTION_DLCEXACT = 10;
const SESSION_MATCH_QUERY_EXTRACTION_DLCANY = 11;
const SESSION_MATCH_QUERY_SCENARIO_DLCEXACT = 12;
const SESSION_MATCH_QUERY_SCENARIO_DLCANY = 13;
const SESSION_MATCH_QUERY_TEAMDEATHMATCH_DLCEXACT = 14;
const SESSION_MATCH_QUERY_TEAMDEATHMATCH_DLCANY = 15;
const SESSION_MATCH_QUERY_PARTY_DLCEXACT = 16;
const SESSION_MATCH_QUERY_PARTY_DLCANY = 17;
const SESSION_MATCH_QUERY_SURVIVAL_DLCEXACT = 20;
const SESSION_MATCH_QUERY_SURVIVAL_DLCANY = 21;
const SESSION_MATCH_QUERY_ALL_DLCMINREQUIRED = 22;
const SESSION_MATCH_QUERY_EXTRACTION_DLCMINREQUIRED = 23;
const SESSION_MATCH_QUERY_SCENARIO_DLCMINREQUIRED = 24;
const SESSION_MATCH_QUERY_TEAMDEATHMATCH_DLCMINREQUIRED = 25;
const SESSION_MATCH_QUERY_PARTY_DLCMINREQUIRED = 26;
const SESSION_MATCH_QUERY_SURVIVAL_DLCMINREQUIRED = 27;
const CONTEXT_GAME_MODE = 0x0000800B;
const CONTEXT_PRESENCE_IDLE = 0;
const CONTEXT_PRESENCE_DEFAULT = 1;
const CONTEXT_PRESENCE_INMENU = 2;
const CONTEXT_PRESENCE_INLOBBY = 3;
const CONTEXT_PRESENCE_INGAME = 4;
const CONTEXT_PRESENCE_INCAMPAIGN = 5;

struct native StartPosition_Rating
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float Rating;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL StartPoint;

    structdefaultproperties
    {
        Rating=0.0000000
        StartPoint=none
    }
};

struct native TeamLifeCount
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private int Attackers;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private int Defenders;

    structdefaultproperties
    {
        Attackers=0
        Defenders=0
    }
};

var(0.25_Pct) /*0x97E50000-0x00000000*/ private float EnemyProximityToSpawn[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TeammateProximityToSpawn[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MinimumProximityToSpawn[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float SpawnRatingBucket_Excellent[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float SpawnRatingBucket_Good[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float SpawnRatingBucket_Acceptable[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float SpawnRatingBucket_Poor[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float SpawnRatingWeight_Excellent[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float SpawnRatingWeight_Good[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float SpawnRatingWeight_Acceptable[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float SpawnRatingWeight_Poor[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float SpawnRuleValue_TeammateProximity[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float SpawnRuleValue_PrimarySpawn[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float SpawnRuleValue_LargeTeammatePresence[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float SpawnRuleValue_SpawnOwner[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float SpawnRuleValue_VisibleToTeammate[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float SpawnRuleValue_LargeEnemyPresence[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float SpawnRuleValue_EnemyProximity[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float SpawnRuleValue_VisibleToEnemy[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float SpawnRuleValue_Telefrag[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float SpawnRuleValue_SpawnDisabled[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TeamColor_1;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TeamColor_2;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TeamColor_3;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bIncapacitatePlayerOnDeath[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bGameReady;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bScoreAkridKill[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bTeamScoreAkridKill[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bScorePlayerKill[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bTeamScorePlayerKill[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bScorePlayerSuicide[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bTeamScorePlayerSuicide[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bPlayerDeathAffectsScore[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bPlayerDeathAffectsTeamScore[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bThermalPickupsAccumulateTeamScore[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bThermalPickupsAccumulateScore[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bThermalExtractionAccumulateTeamScore[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bThermalExtractionAccumulateScore[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bAllowNegativePlayerScore[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bAllowNegativeTeamScore[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bPlayedWinLoseAnnouncementTeam1;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bPlayedWinLoseAnnouncementTeam2;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bDualAttackers[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bRestartCleanupStarted;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bFirstBloodDrawn[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bEndLevelCleanup;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bDisableAISpawning;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bStartingMatch;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TeamLives[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int AttackingTeamIndex[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array TeamNameList[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL SeekFreeMultiClassLoader;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int MatchCompletionBonus[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MatchDataStore;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float RoundStartAnnouncementDelay[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int RoundsToWin;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int UpdateGameSettingsTime;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array NevecClasses;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array PirateClasses;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MapInfoStartTime;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int NetFrequencyOverride;
//var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> __CompareStartPosition_Ratings__Delegate;

delegate CompareStartPosition_Ratings()
{
    local /*0x97E50000-0x00000000*/ private @NULL A[8388609], B;
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];

    return int(A.Rating - B.Rating);
    //return ReturnValue;    
}

event PreBeginPlay()
{
    super.PreBeginPlay();
    SeekFreeMultiClassLoader = new (self) Class'SPEngine.SPSeekFreeMultiClassLoader';
    SeekFreeMultiClassLoader.__LoadComplete__Delegate = PawnClassLoaded;
    //return;    
}

event PostBeginPlay()
{
    local /*0x97E50000-0x00000000*/ private @NULL GameSettings, MPManager;

    // End:0x178
    if((int(WorldInfo.NetMode) == int(NM_DedicatedServer)) || int(WorldInfo.NetMode) == int(NM_ListenServer))
    {
        // End:0x150
        if(NotEqual_InterfaceInterface(GameInterface, OnlineGameInterface(none)))
        {
            MPManager = Class'LPMultiplayerManager'.static.GetInstance();
            GameSettings = LPOnlineGameSettings(GameInterface.GetGameSettings(MPManager.SessionNameGame));
            // End:0x150
            if(GameSettings != none)
            {
                GameSettings.SetMatchState(1);
                UpdateGameSettings();
                MPManager.UpdateGameSettings(GameSettings);
            }
        }
        // End:0x178
        if(UpdateGameSettingsTime > 0)
        {
            SetTimer(float(UpdateGameSettingsTime), true, 'UpdateGameSettings');
        }
    }
    SetTimer(50.0000000, false, 'StartTheGame');
    MapInfoStartTime = WorldInfo.TimeSeconds;
    super.PostBeginPlay();
    //return;    
}

event PostLogin()
{
    local /*0x97E50000-0x00000000*/ private @NULL NewPlayer[8388609], LPPC;

    NewPlayer.PlayerReplicationInfo.bOnlySpectator = false;
    super.PostLogin(NewPlayer);
    // End:0x9B
    if(NumPlayers > MaxPlayers)
    {
        LPPC = LPPlayerController(NewPlayer);
        LPPC.ClientGameFullError();
    }
    Class'LPMultiplayerManager'.static.GetInstance().UpdatePlayerCounts(Class'LPMultiplayerManager'.static.GetInstance().SessionNameGame);
    //return;    
}

function SetPlayerClassFromPlayerSelection()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPPC[8388609], WPRI;
    local /*0x97E50000-0x00000000*/ private int InTeam[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize string DesiredClassPath[8388609];
    local /*0x97E50000-0x00000000*/ private class DesiredClass;
    local /*0x97E50000-0x00000000*/ private @NULL PC;
    local /*0x97E50000-0x00000000*/ private bool bReplicateLoad;

    // End:0x26
    if(WPRI.Team == none)
    {
        return;
    }
    // End:0x38
    if(DesiredClassPath == "")
    {
        return;
    }
    // End:0xD7
    if(LPPC != none)
    {
        // End:0xD7
        if(!LPPC.IsValidSkinForServer(DesiredClassPath))
        {
            // End:0xAF
            if(InTeam == 1)
            {
                DesiredClassPath = Class'LPPRI'.default.DesiredPiratePawnClassName;                
            }
            else
            {
                DesiredClassPath = Class'LPPRI'.default.DesiredNevecPawnClassName;
            }
        }
    }
    DesiredClass = class<LPPlayerPawn>(FindObject(DesiredClassPath, Class'Core.Class'));
    // End:0x1AC
    if(DesiredClass != none)
    {
        // End:0x181
        if(SeekFreeMultiClassLoader.LoadedClasses.Find(DesiredClass) == )
        {            
            SeekFreeMultiClassLoader.LoadedClasses.AddItem(DesiredClass);            
            bReplicateLoad = true;
        }
        WPRI.SetPawnClass(DesiredClass);        
    }
    else
    {
        // End:0x23C
        if(IsInState('PendingMatch') && (SeekFreeMultiClassLoader.PendingClasses.Length + SeekFreeMultiClassLoader.LoadedClasses.Length) < 12)
        {
            SeekFreeMultiClassLoader.LoadClass(DesiredClassPath);
            bReplicateLoad = true;            
        }
        else
        {
            WPRI.SetPawnClass(none);
            // End:0x323
            if(((WPRI.Owner != none) && NetConnection(PlayerController(WPRI.Owner).Player) != none) && SeekFreeMultiClassLoader.PendingClasses.Find(DesiredClassPath) == )
            {                
                WPRI.NotifyPlayerSelectionNotPossible();
            }
        }
    }
    // End:0x42F
    if(bReplicateLoad)
    {
        // End:0x42E
        foreach WorldInfo.AllControllers(Class'LPPlayerController', PC)
        {
            // End:0x42D
            if(((NetConnection(PC.Player) != none) && ChildConnection(PC.Player) == none) && PC.HasClientLoadedCurrentWorld())
            {
                PC.bSkinsLoaded = false;
                PC.ClientLoadCharacter(DesiredClassPath);
            }            
        }        
    }
    //return;    
}

function SetPlayerClass()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609];
    local /*0x97E50000-0x00000000*/ private int N[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PRI, OtherPC;

    OtherPC = LPPlayerController(Other);
    PRI = LPPRI(Other.PlayerReplicationInfo);
    // End:0xA9
    if(OtherPC != none)
    {
        SetPlayerClassFromPlayerSelection(OtherPC, PRI, N, PRI.GetDesiredPawnClass(N));
    }
    //return;    
}

function PawnClassLoaded()
{
    local /*0x97E50000-0x00000000*/ private class LoadedClass[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PRI;
    local /*0x97E50000-0x00000000*/ private int I;
    local /*0x97E50000-0x00000000*/ private bool bFound;
    local /*0x97E50000-0x00000000*/ private @NULL PC;
    local /*0x97E50000-0x00000000*/ private editfixedsize string PawnClassPath;
    local /*0x97E50000-0x00000000*/ private class PawnClass;

    PawnClass = class<LPPawn>(LoadedClass);
    I = 0;
    J0x27:

    // End:0x1D4 [Loop If]
    if(I < GameReplicationInfo.PRIArray.Length)
    {
        PRI = LPPRI(GameReplicationInfo.PRIArray[I]);
        // End:0x1C6
        if((PRI != none) && PRI.Team != none)
        {
            // End:0x1C6
            if(PRI.GetDesiredPawnClass(PRI.Team.TeamIndex) ~= PathName(PawnClass))
            {
                PRI.PawnClass = PawnClass;
                SetPlayerClass(Controller(PRI.Owner), PRI.Team.TeamIndex);
                bFound = true;
            }
        }
        I++;
        // [Loop Continue]
        goto J0x27;
    }
    // End:0x248
    if(bFound)
    {
        // End:0x245
        if(int(WorldInfo.NetMode) != int(NM_DedicatedServer))
        {
            PawnClass.default.Mesh.PrestreamTextures(5.0000000, false);
        }        
    }
    else
    {
        SeekFreeMultiClassLoader.LoadedClasses.RemoveItem(PawnClass);        
        PawnClassPath = PathName(PawnClass);
        // End:0x36D
        foreach WorldInfo.AllControllers(Class'LPPlayerController', PC)
        {
            // End:0x36C
            if(((NetConnection(PC.Player) != none) && ChildConnection(PC.Player) == none) && PC.HasClientLoadedCurrentWorld())
            {
                PC.ClientUnloadCharacter(PawnClassPath);
            }            
        }        
        WorldInfo.ForceGarbageCollection();
    }
    //return;    
}

function SendGameTimeExpiredEvent()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private editfixedsize array EventsToActivate, ActivateIndices;
    local /*0x97E50000-0x00000000*/ private @NULL GameSeq;
    local /*0x97E50000-0x00000000*/ private bool bResult;
    local /*0x97E50000-0x00000000*/ private int I;

    GameSeq = WorldInfo.GetGameSequence();
    // End:0xFE
    if(GameSeq != none)
    {
        GameSeq.FindSeqObjectsByClass(Class'LPSeqEvent_TimerExpired', true, EventsToActivate);
        ActivateIndices[0] = 0;
        I = 0;
        J0x82:

        // End:0xFE [Loop If]
        if(I < EventsToActivate.Length)
        {
            // End:0xF0
            if(SequenceEvent(EventsToActivate[I]).CheckActivate(WorldInfo, none, false, ActivateIndices))
            {
                bResult = true;
            }
            I++;
            // [Loop Continue]
            goto J0x82;
        }
    }
    return bResult;
    //return ReturnValue;    
}

function AllowCheats()
{
    local /*0x97E50000-0x00000000*/ private @NULL P[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

function CheckScore()
{
    local /*0x97E50000-0x00000000*/ private @NULL Scorer[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return super(GameInfo).CheckScore(Scorer);
    //return ReturnValue;    
}

function ScoreKill()
{
    local /*0x97E50000-0x00000000*/ private @NULL Killer[8388609], Victim, VictimPRI, KillerPRI, TurretController;

    TurretController = LPAIControllerTurret(Killer);
    KillerPRI = ((TurretController != none) ? LPPRI(TurretController.GetAssociatedPlayerPRI()) : LPPRI(Killer.PlayerReplicationInfo));
    VictimPRI = LPPRI(Victim.PlayerReplicationInfo);
    // End:0x209
    if((Killer == Victim) || Killer == none)
    {
        // End:0x206
        if((Victim != none) && VictimPRI != none)
        {
            // End:0x150
            if(bScorePlayerSuicide)
            {
                VictimPRI.Score -= float(1);
                VictimPRI.bForceNetUpdate = true;
            }
            // End:0x206
            if(bTeamScorePlayerSuicide && Victim.PlayerReplicationInfo.Team != none)
            {
                VictimPRI.Team.Score -= float(1);
                VictimPRI.Team.bForceNetUpdate = true;
            }
        }        
    }
    else
    {
        // End:0x573
        if(KillerPRI != none)
        {
            // End:0x40B
            if(LPAIControllerAkrid(Victim) != none)
            {
                // End:0x281
                if(bScoreAkridKill)
                {
                    KillerPRI.Score += float(1);
                    KillerPRI.bForceNetUpdate = true;
                }
                // End:0x322
                if(bTeamScoreAkridKill && KillerPRI.Team != none)
                {
                    KillerPRI.Team.Score += float(1);
                    KillerPRI.Team.bForceNetUpdate = true;
                }
                // End:0x3B8
                if((LPAIControllerAkridLarge(Victim) != none) || LPAIControllerAkridMedium(Victim) != none)
                {
                    // End:0x3B8
                    if(KillerPRI.Owner != none)
                    {
                        LPPlayerController(KillerPRI.Owner).BroadcastChatter(13);
                    }
                }
                KillerPRI.HandleAkridKillStats(Victim);
                VictimPRI.HandleAkridDeathStats(KillerPRI);                
            }
            else
            {
                // End:0x573
                if((LPPlayerController(Victim) != none) && int(Killer.GetTeamNum()) != int(Victim.GetTeamNum()))
                {
                    // End:0x4BD
                    if(bScorePlayerKill)
                    {
                        KillerPRI.Score += float(1);
                        KillerPRI.bForceNetUpdate = true;
                    }
                    // End:0x573
                    if(bTeamScorePlayerKill && Killer.PlayerReplicationInfo.Team != none)
                    {
                        KillerPRI.Team.Score += float(1);
                        KillerPRI.Team.bForceNetUpdate = true;
                    }
                }
            }
        }
    }
    // End:0x692
    if(LPPlayerController(Victim) != none)
    {
        // End:0x5DC
        if(bPlayerDeathAffectsScore)
        {
            VictimPRI.Score -= float(1);
            VictimPRI.bForceNetUpdate = true;
        }
        // End:0x692
        if(bPlayerDeathAffectsTeamScore && Victim.PlayerReplicationInfo.Team != none)
        {
            VictimPRI.Team.Score -= float(1);
            VictimPRI.Team.bForceNetUpdate = true;
        }
    }
    ModifyScoreKill(Killer, Victim);
    // End:0x701
    if(!bAllowNegativePlayerScore)
    {
        VictimPRI.Score = float(Max(int(VictimPRI.Score), 0));
    }
    // End:0x77E
    if(!bAllowNegativeTeamScore)
    {
        VictimPRI.Team.Score = float(Max(int(VictimPRI.Team.Score), 0));
    }
    // End:0x7B1
    if((Killer != none) || MaxLives > 0)
    {
        CheckScore(KillerPRI);
    }
    //return;    
}

function ScoreIncapacitation()
{
    local /*0x97E50000-0x00000000*/ private @NULL Killer[8388609], Victim;

    //return;    
}

function ScoreRevival()
{
    local /*0x97E50000-0x00000000*/ private @NULL Savior[8388609], RevivedPlayer;

    //return;    
}

function PerformEndGameHandling()
{
    super(GameInfo).PerformEndGameHandling();
    //return;    
}

function EndOnlineGame()
{
    RemoveMPActorsDueToEndOfRound();
    super(SPGameInfo).EndOnlineGame();
    EndLevelCleanup();
    //return;    
}

event CanSpawnAI()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x0F
    if(bDisableAISpawning)
    {
        return false;
    }
    return true;
    //return ReturnValue;    
}

function RemoveMPActorsDueToEndOfRound()
{
    local /*0x97E50000-0x00000000*/ private @NULL M, P, Proj;

    bEndLevelCleanup = true;
    bDisableAISpawning = true;
    // End:0x7F
    foreach WorldInfo.AllPawns(Class'Engine.Pawn', P)
    {
        // End:0x7E
        if(LPPawn(P) != none)
        {
            P.Destroy();
        }        
    }    
    // End:0xB2
    foreach AllActors(Class'LPTotemProximityMine', M)
    {
        M.Destroy();        
    }    
    // End:0xE5
    foreach AllActors(Class'Engine.Projectile', Proj)
    {
        Proj.Destroy();        
    }    
    bEndLevelCleanup = false;
    //return;    
}

function EndLevelCleanup()
{
    bPlayedWinLoseAnnouncementTeam1 = false;
    bPlayedWinLoseAnnouncementTeam2 = false;
    //return;    
}

function ChoosePlayerStart()
{
    local /*0x97E50000-0x00000000*/ private @NULL Player[8388609];
    local /*0x97E50000-0x00000000*/ private byte InTeam[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private editfixedsize array StartPositionsExcellent, StartPositionsGood, StartPositionsAcceptable, StartPositionsPoor;
    local /*0x97E50000-0x00000000*/ private float RatingValuesExcellent, RatingValuesGood, RatingValuesAcceptable;
    local /*0x97E50000-0x00000000*/ private @NULL RatedPosition;
    local /*0x97E50000-0x00000000*/ private byte Team;
    local /*0x97E50000-0x00000000*/ private @NULL P;
    local /*0x97E50000-0x00000000*/ private float Rating;
    local /*0x97E50000-0x00000000*/ private int WhichOne;
    local /*0x97E50000-0x00000000*/ private @NULL LastResort;

    Team = ((((Player != none) && Player.PlayerReplicationInfo != none) && Player.PlayerReplicationInfo.Team != none) ? byte(Player.PlayerReplicationInfo.Team.TeamIndex) : InTeam);
    // End:0x316
    foreach WorldInfo.AllNavigationPoints(Class'Engine.PlayerStart', P)
    {
        LastResort = P;
        Rating = RatePlayerStart(P, Team, Player);
        RatedPosition.Rating = Rating;
        RatedPosition.StartPoint = P;
        // End:0x219
        if(((P.TeamIndex != 255) && int(Team) != P.TeamIndex) && Rating >= SpawnRatingBucket_Poor)
        {
            StartPositionsPoor.AddItem(RatedPosition);            
            // End:0x315
            continue;
        }
        // End:0x25D
        if(Rating >= SpawnRatingBucket_Excellent)
        {
            StartPositionsExcellent.AddItem(RatedPosition);            
            RatingValuesExcellent += SpawnRatingWeight_Excellent;
            // End:0x315
            continue;
        }
        // End:0x2A1
        if(Rating >= SpawnRatingBucket_Good)
        {
            StartPositionsGood.AddItem(RatedPosition);            
            RatingValuesGood += SpawnRatingWeight_Good;
            // End:0x315
            continue;
        }
        // End:0x2E5
        if(Rating >= SpawnRatingBucket_Acceptable)
        {
            StartPositionsAcceptable.AddItem(RatedPosition);            
            RatingValuesAcceptable += SpawnRatingWeight_Acceptable;
            // End:0x315
            continue;
        }
        // End:0x315
        if(Rating >= SpawnRatingBucket_Poor)
        {
            StartPositionsPoor.AddItem(RatedPosition);            
            // End:0x315
            continue;
        }        
    }    
    // End:0x398
    if(((RatingValuesExcellent + RatingValuesGood) + RatingValuesAcceptable) == float(0))
    {
        // End:0x358
        if(StartPositionsPoor.Length == 0)
        {
            return LastResort;
        }
        WhichOne = Rand(StartPositionsPoor.Length);
        return StartPositionsPoor[WhichOne].StartPoint;        
    }
    else
    {
        WhichOne = Rand(int((RatingValuesExcellent + RatingValuesGood) + RatingValuesAcceptable));
        // End:0x41B
        if(float(WhichOne) < RatingValuesAcceptable)
        {
            WhichOne = Rand(StartPositionsAcceptable.Length);
            return StartPositionsAcceptable[WhichOne].StartPoint;
        }
        WhichOne -= int(RatingValuesAcceptable);
        // End:0x487
        if(float(WhichOne) < RatingValuesGood)
        {
            WhichOne = Rand(StartPositionsGood.Length);
            return StartPositionsGood[WhichOne].StartPoint;
        }
        WhichOne = Rand(StartPositionsExcellent.Length);
        return StartPositionsExcellent[WhichOne].StartPoint;
    }
    return LastResort;
    //return ReturnValue;    
}

function Logout()
{
    local /*0x97E50000-0x00000000*/ private @NULL Exiting[8388609], PC;

    BroadcastKillMessage(Exiting, Exiting, none);
    PC = LPPlayerController(Exiting);
    // End:0x67
    if(PC != none)
    {
        PC.DisconnectPartyMembersFromParty();
    }
    super(GameInfo).Logout(Exiting);
    Class'LPMultiplayerManager'.static.GetInstance().UpdatePlayerCounts(Class'LPMultiplayerManager'.static.GetInstance().SessionNameGame);
    //return;    
}

function BroadcastKillMessage()
{
    local /*0x97E50000-0x00000000*/ private @NULL Killer[8388609], Other;
    local /*0x97E50000-0x00000000*/ private class DamageType[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL AIKiller, KillerPRI;

    AIKiller = LPAIController(Killer);
    // End:0xD3
    if(AIKiller != none)
    {
        KillerPRI = AIKiller.GetAssociatedPlayerPRI();
        // End:0x8B
        if(KillerPRI == none)
        {
            KillerPRI = Killer.PlayerReplicationInfo;
        }
        BroadcastLocalized(self, DeathMessageClass, 0, KillerPRI, Other.PlayerReplicationInfo, DamageType);        
    }
    else
    {
        BroadcastDeathMessage(Killer, Other, DamageType);
    }
    //return;    
}

function BroadcastDeathMessage()
{
    local /*0x97E50000-0x00000000*/ private @NULL Killer[8388609], Other;
    local /*0x97E50000-0x00000000*/ private class DamageType[8388609];

    //return;    
}

function RatePlayerStart()
{
    local /*0x97E50000-0x00000000*/ private @NULL P[8388609];
    local /*0x97E50000-0x00000000*/ private byte Team[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL Player[8388609];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL OtherPlayer;
    local /*0x97E50000-0x00000000*/ private bool bTelefragTeammate, bTelefragEnemy;
    local /*0x97E50000-0x00000000*/ private float Distance, TotalDistanceFromEnemy, TotalDistanceFromTeam;
    local /*0x97E50000-0x00000000*/ private int EnemiesInProximity, TeamInProximity, PawnsConsidered;
    local /*0x97E50000-0x00000000*/ private bool bNearerTeamThanEnemy, bMoreTeamThanEnemy, bCanBeSeen;
    local /*0x97E50000-0x00000000*/ private float Rating;
    local /*0x97E50000-0x00000000*/ private bool bOwnedByTeam, bCanBeSeenFriendly;
    local /*0x97E50000-0x00000000*/ private @NULL LPS, LPP, SV;

    bTelefragEnemy = false;
    bTelefragTeammate = false;
    TotalDistanceFromEnemy = 0.0000000;
    TotalDistanceFromTeam = 0.0000000;
    PawnsConsidered = 0;
    bNearerTeamThanEnemy = false;
    bMoreTeamThanEnemy = false;
    bCanBeSeen = false;
    EnemiesInProximity = 0;
    TeamInProximity = 0;
    bOwnedByTeam = false;
    bCanBeSeenFriendly = false;
    Rating = 0.0000000;
    // End:0xD0
    if(!P.bEnabled)
    {
        return SpawnRuleValue_SpawnDisabled;
    }
    LPS = LPPlayerStart(P);
    // End:0x10E
    if(LPPlayerStart_MP(P) == none)
    {
        return SpawnRuleValue_SpawnDisabled;
    }
    // End:0x148
    if(P.TeamIndex == int(Team))
    {
        bOwnedByTeam = true;
    }
    // End:0x1DC
    if((((LPS != none) && LPS.bConsiderDisabledForEnemies) && P.TeamIndex != 255) && P.TeamIndex != int(Team))
    {
        return SpawnRuleValue_SpawnDisabled;
    }
    // End:0x212
    if(P.bPrimaryStart)
    {
        Rating += SpawnRuleValue_PrimarySpawn;
    }
    // End:0x233
    if(bOwnedByTeam)
    {
        Rating += SpawnRuleValue_SpawnOwner;
    }
    // End:0x795
    foreach WorldInfo.AllControllers(Class'Engine.Controller', OtherPlayer)
    {
        // End:0x794
        if((OtherPlayer.bIsPlayer && OtherPlayer.Pawn != none) || LPAIControllerAkrid(OtherPlayer) != none)
        {
            ++PawnsConsidered;
            // End:0x528
            if((Abs(P.Location.Z - OtherPlayer.Pawn.Location.Z) < (P.CylinderComponent.CollisionHeight + OtherPlayer.Pawn.CylinderComponent.CollisionHeight)) && VSize2D(P.Location - OtherPlayer.Pawn.Location) < (P.CylinderComponent.CollisionRadius + OtherPlayer.Pawn.CylinderComponent.CollisionRadius))
            {
                // End:0x51C
                if(int(Team) != int(OtherPlayer.PlayerReplicationInfo.Team.GetTeamNum()))
                {
                    bTelefragEnemy = true;                    
                }
                else
                {
                    bTelefragTeammate = true;
                }
            }
            // End:0x794
            if(Abs(P.Location.Z - OtherPlayer.Pawn.Location.Z) < (P.CylinderComponent.CollisionHeight + OtherPlayer.Pawn.CylinderComponent.CollisionHeight))
            {
                Distance = VSize(P.Location - OtherPlayer.Pawn.Location);
                // End:0x73B
                if(int(Team) != int(OtherPlayer.PlayerReplicationInfo.Team.GetTeamNum()))
                {
                    // End:0x702
                    if(Distance <= MinimumProximityToSpawn)
                    {
                        bTelefragEnemy = true;
                    }
                    // End:0x738
                    if(Distance <= EnemyProximityToSpawn)
                    {
                        TotalDistanceFromEnemy += Distance;
                        ++EnemiesInProximity;
                    }
                    // End:0x794
                    continue;
                }
                // End:0x75E
                if(Distance <= MinimumProximityToSpawn)
                {
                    bTelefragTeammate = true;
                }
                // End:0x794
                if(Distance <= TeammateProximityToSpawn)
                {
                    TotalDistanceFromTeam += Distance;
                    ++TeamInProximity;
                }
            }
        }        
    }    
    // End:0x89A
    if(LPS != none)
    {
        // End:0x899
        foreach LPS.SpawnVolumes(SV)
        {
            // End:0x897
            foreach SV.TouchingActors(Class'LPPlayerPawn', LPP)
            {
                // End:0x896
                if(LPP.IsAliveAndWell())
                {
                    // End:0x88A
                    if(int(LPP.PlayerReplicationInfo.Team.GetTeamNum()) == int(Team))
                    {
                        bCanBeSeenFriendly = true;
                        // End:0x896
                        continue;
                    }
                    bCanBeSeen = true;
                }                
            }                        
        }        
    }
    // End:0x8C9
    if(EnemiesInProximity > 0)
    {
        TotalDistanceFromEnemy = TotalDistanceFromEnemy / float(EnemiesInProximity);
    }
    // End:0x8F8
    if(TeamInProximity > 0)
    {
        TotalDistanceFromTeam = TotalDistanceFromTeam / float(TeamInProximity);
    }
    // End:0x91B
    if(TotalDistanceFromTeam > TotalDistanceFromEnemy)
    {
        bNearerTeamThanEnemy = true;
    }
    // End:0x93E
    if(TeamInProximity > EnemiesInProximity)
    {
        bMoreTeamThanEnemy = true;
    }
    // End:0x95F
    if(bNearerTeamThanEnemy)
    {
        Rating += SpawnRuleValue_TeammateProximity;
    }
    // End:0x980
    if(bMoreTeamThanEnemy)
    {
        Rating += SpawnRuleValue_LargeTeammatePresence;
    }
    // End:0x9AB
    if(TotalDistanceFromTeam < TotalDistanceFromEnemy)
    {
        Rating += SpawnRuleValue_EnemyProximity;
    }
    // End:0x9D6
    if(EnemiesInProximity > TeamInProximity)
    {
        Rating += SpawnRuleValue_LargeEnemyPresence;
    }
    // End:0x9F7
    if(bCanBeSeen)
    {
        Rating += SpawnRuleValue_VisibleToEnemy;
    }
    // End:0xA18
    if(bCanBeSeenFriendly)
    {
        Rating += SpawnRuleValue_VisibleToTeammate;
    }
    // End:0xA48
    if(bTelefragEnemy || bTelefragTeammate)
    {
        Rating += SpawnRuleValue_Telefrag;
    }
    return Rating;
    //return ReturnValue;    
}

function ReduceDamage()
{
    local /*0x97E50000-0x00000000*/ private int Damage[25165825];
    local /*0x97E50000-0x00000000*/ private @NULL injured[8388609], InstigatedBy, HitLocation, Momentum;
    local /*0x97E50000-0x00000000*/ private class DamageType[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL DamageCauser[8388609];
    local /*0x97E50000-0x00000000*/ private bool bIsFriendlyFire;

    // End:0x2D1
    if((!bAllowFriendlyFire && InstigatedBy != none) && injured.Controller != InstigatedBy)
    {
        bIsFriendlyFire = false;
        // End:0x1FE
        if((InstigatedBy.Pawn == none) && LPPlayerController(InstigatedBy) != none)
        {
            // End:0x1FB
            if((InstigatedBy.PlayerReplicationInfo != none) && injured.PlayerReplicationInfo != none)
            {
                // End:0x1FB
                if((injured.PlayerReplicationInfo.Team == InstigatedBy.PlayerReplicationInfo.Team) && injured.PlayerReplicationInfo.Team.TeamIndex == InstigatedBy.PlayerReplicationInfo.Team.TeamIndex)
                {
                    bIsFriendlyFire = true;
                    Damage = 0;
                }
            }            
        }
        else
        {
            // End:0x255
            if(injured.IsSameTeam(InstigatedBy.Pawn))
            {
                bIsFriendlyFire = true;
                Damage = 0;
            }
        }
        // End:0x2D1
        if(bIsFriendlyFire && LPPlayerController(injured.Controller) != none)
        {
            LPPlayerController(injured.Controller).BroadcastChatter(4);
        }
    }
    super.ReduceDamage(Damage, injured, InstigatedBy, HitLocation, Momentum, DamageType, DamageCauser);
    //return;    
}

static function GetTeamColor()
{
    local /*0x97E50000-0x00000000*/ private int TeamIndex[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    TeamIndex = TeamIndex % 3;
    switch(TeamIndex)
    {
        // End:0x4D
        case 0:
            return Class'LPGameMP_Base'.default.TeamColor_1;
        // End:0x70
        case 1:
            return Class'LPGameMP_Base'.default.TeamColor_2;
        // End:0x94
        case 2:
            return Class'LPGameMP_Base'.default.TeamColor_3;
        // End:0xFFFF
        default:
            return Class'LPGameMP_Base'.default.TeamColor_1;
            break;
    }
    //return ReturnValue;    
}

static function GetTeamLinearColor()
{
    local /*0x97E50000-0x00000000*/ private int TeamIndex[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], Col, LCol;

    Col = GetTeamColor(TeamIndex);
    LCol.R = float(Col.R) / float(255);
    LCol.G = float(Col.G) / float(255);
    LCol.B = float(Col.B) / float(255);
    LCol.A = float(Col.A) / float(255);
    return LCol;
    //return ReturnValue;    
}

static function GetTeamName()
{
    local /*0x97E50000-0x00000000*/ private int TeamIndex[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize string ReturnValue[92274689], Result;

    TeamIndex = TeamIndex % 3;
    Result = Class'SPEngine.SPUtil'.static.GetLocalizedString(default.TeamNameList[TeamIndex].TeamName);
    // End:0x9B
    if(Class'SPGfx.SPGFxUIView'.static.IsLocalizationSuccessful(Result))
    {
        return Result;
    }
    switch(TeamIndex)
    {
        // End:0xBA
        case 0:
            return "NEVEC";
        // End:0xCD
        case 1:
            return "SNOW PIRATES";
        // End:0xDA
        case 2:
            return "AKRID";
        // End:0xFFFF
        default:
            return "NEVEC";
            break;
    }
    //return ReturnValue;    
}

function InitializeTeams()
{
    local /*0x97E50000-0x00000000*/ private int Idx;
    local /*0x97E50000-0x00000000*/ private @NULL Col;

    Idx = 0;
    J0x0B:

    // End:0x4B3 [Loop If]
    if(Idx < int(NumTeams))
    {
        Col = GetTeamColor(Idx);
        Teams[Idx] = Spawn(Class'LPTeamInfo_MP', self);
        Teams[Idx].TeamIndex = Idx;
        Teams[Idx].TeamColor = Col;
        Teams[Idx].SetTeamName(Class'SPEngine.SPUtil'.static.GetLocalizedString(TeamNameList[Idx].TeamName));
        // End:0x28A
        if(TeamNameList[Idx].TeamName == "")
        {
            switch(Teams[Idx].TeamIndex)
            {
                // End:0x1D7
                case 0:
                    Teams[Idx].SetTeamName("NEVEC");
                    // End:0x28A
                    break;
                // End:0x215
                case 1:
                    Teams[Idx].SetTeamName("SNOW PIRATES");
                    // End:0x28A
                    break;
                // End:0x24D
                case 2:
                    Teams[Idx].SetTeamName("AKRID");
                    // End:0x28A
                    break;
                // End:0x287
                case 3:
                    Teams[Idx].SetTeamName("NEUTRAL");
                    // End:0x28A
                    break;
                // End:0xFFFF
                default:
                    break;
            }
        }
        else
        {
            // End:0x46A
            if(AttackingTeamIndex >= 0)
            {
                // End:0x301
                if(AttackingTeamIndex == Idx)
                {
                    LPTeamInfo_MP(Teams[Idx]).MaxTeamLives = TeamLives.Attackers;                    
                }
                else
                {
                    LPTeamInfo_MP(Teams[Idx]).MaxTeamLives = TeamLives.Defenders;
                }
                LPTeamInfo_MP(Teams[Idx]).bAttackingTeam = AttackingTeamIndex == Idx;
                LPTeamInfo_MP(Teams[Idx]).bDualAttackers = bDualAttackers;
                LPTeamInfo_MP(Teams[Idx]).TeamLives = LPTeamInfo_MP(Teams[Idx]).MaxTeamLives;
                LPTeamInfo_MP(Teams[Idx]).bUseTeamLives = true;
            }
            GameReplicationInfo.SetTeam(Idx, Teams[Idx]);
            Idx++;
            // [Loop Continue]
            goto J0x0B;
        }/* !MISMATCHING REMOVE, tried Loop got Type:Else Position:0x28A! */
        //return;        
    }/* !MISMATCHING REMOVE, tried Else got Type:Loop Position:0x00B! */
}

function Reset()
{
    super(GameInfo).Reset();
    bRestartCleanupStarted = false;
    GetGRI().bMatchIsOver = false;
    //return;    
}

function ProcessServerTravel()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string URL[8388609];
    local /*0x97E50000-0x00000000*/ private bool bAbsolute[9437185];

    Class'SPEngine.SPUtil'.static.CleanUpBeforeLevelTransition();
    ClearTimer('UpdateGameSettings');
    super(GameInfo).ProcessServerTravel(URL, bAbsolute);
    LPGRI_Base_MP(GetGRI()).SetGameStatus(6);
    //return;    
}

function InitGameReplicationInfo()
{
    local /*0x97E50000-0x00000000*/ private int I;
    local /*0x97E50000-0x00000000*/ private @NULL GRI;

    super.InitGameReplicationInfo();
    GRI = LPGRI_Base_MP(GetGRI());
    // End:0x2A9
    if(GRI != none)
    {
        GRI.InitServerDLCInfos();
        // End:0xC8
        if((HostMigrationManager != none) && !bResetOnHostMigration)
        {
            GoalScore = GRI.GoalScore;
            TimeLimit = GRI.TimeLimit;            
        }
        else
        {
            GRI.RemainingMinute = TimeLimit * 60;
            GRI.RemainingTime = TimeLimit * 60;
            GRI.ElapsedTime = 0;
            GRI.TimeLimit = TimeLimit;
            GRI.GoalScore = GoalScore;
            GRI.bIsQuickMatch = Class'LPMultiplayerManager'.static.GetInstance().bIsQuickMatch;
            I = 0;
            J0x1F0:

            // End:0x2A9 [Loop If]
            if(I < GRI.Teams.Length)
            {
                // End:0x29B
                if(LPTeamInfo_MP(GRI.Teams[I]) != none)
                {
                    LPTeamInfo_MP(GRI.Teams[I]).ResetGame();
                }
                ++I;
                // [Loop Continue]
                goto J0x1F0;
            }
        }
    }
    //return;    
}

function InitGameDifficulty()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string Options[8388609], ErrorMessage;

    super.InitGameDifficulty(Options, ErrorMessage);
    //return;    
}

function SpawnDefaultPawnFor()
{
    local /*0x97E50000-0x00000000*/ private @NULL NewPlayer[8388609], StartSpot, ReturnValue;
    local /*0x97E50000-0x00000000*/ private class DefaultPlayerClass;
    local /*0x97E50000-0x00000000*/ private @NULL StartRotation, ResultPawn, NewLoc;

    DefaultPlayerClass = GetDefaultPlayerClass(NewPlayer, StartSpot);
    NewLoc = StartSpot.Location;
    NewLoc.Z += float(12);
    StartRotation.Yaw = StartSpot.Rotation.Yaw;
    ResultPawn = Spawn(DefaultPlayerClass,,, NewLoc, StartRotation,, true);
    // End:0x101
    if(ResultPawn == none)
    {
    }
    return ResultPawn;
    //return ReturnValue;    
}

function GetDefaultPlayerClass()
{
    local /*0x97E50000-0x00000000*/ private @NULL C[8388609], StartSpot;
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL PRI;

    PRI = LPPRI(C.PlayerReplicationInfo);
    // End:0xE4
    if(PRI != none)
    {
        // End:0xA1
        if(PRI.PawnClass == none)
        {
            LPSetPlayerClass(C, int(C.GetTeamNum()), StartSpot);
        }
        // End:0xE4
        if(PRI.PawnClass != none)
        {
            return PRI.PawnClass;
        }
    }
    return super(SPGameInfo).GetDefaultPlayerClass(C, StartSpot);
    //return ReturnValue;    
}

function ChangeTeam()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609];
    local /*0x97E50000-0x00000000*/ private int N[8388609];
    local /*0x97E50000-0x00000000*/ private bool bNewTeam[8388609], ReturnValue;
    local /*0x97E50000-0x00000000*/ private @NULL LPPC;

    // End:0x2D
    if((N >= int(NumTeams)) && N != 255)
    {
        return false;
    }
    LPPC = LPPlayerController(Other);
    // End:0x80
    if(LPPC != none)
    {
        LPPC.PickedTeamNum = N;
    }
    return super(SPGameInfo).ChangeTeam(Other, N, bNewTeam);
    //return ReturnValue;    
}

function LPSetPlayerClass()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609];
    local /*0x97E50000-0x00000000*/ private int N[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL StartSpot[8388609], PRI;
    local /*0x97E50000-0x00000000*/ private class FoundPawnClass;
    local /*0x97E50000-0x00000000*/ private editfixedsize array ClassesArray;
    local /*0x97E50000-0x00000000*/ private int Random;
    local /*0x97E50000-0x00000000*/ private editfixedsize array SkinsToChooseFrom, AvailablePawnClasses;

    PRI = LPPRI(Other.PlayerReplicationInfo);
    SkinsToChooseFrom = (((N % 2) == 0) ? Class'LPGFxPreGameLobbySettings'.default.NevecSkins : Class'LPGFxPreGameLobbySettings'.default.PirateSkins);
    // End:0x198
    if(SkinsToChooseFrom.Length > 0)
    {
        Random = 0;
        J0xA7:

        // End:0x13E [Loop If]
        if(Random < SkinsToChooseFrom.Length)
        {
            FoundPawnClass = class<SPPawn>(FindObject(SkinsToChooseFrom[Random].ClassName, Class'Core.Class'));
            // End:0x130
            if(FoundPawnClass != none)
            {
                AvailablePawnClasses.AddItem(FoundPawnClass);                
            }
            ++Random;
            // [Loop Continue]
            goto J0xA7;
        }
        // End:0x198
        if(AvailablePawnClasses.Length > 0)
        {
            Random = Rand(AvailablePawnClasses.Length);
            PRI.SetPawnClass(AvailablePawnClasses[Random]);
            return;
        }
    }
    ClassesArray = (((N % 2) == 0) ? NevecClasses : PirateClasses);
    // End:0x1DB
    if(ClassesArray.Length <= 0)
    {
        return;
    }
    Random = Rand(ClassesArray.Length);
    PRI.SetPawnClass(ClassesArray[Random].PawnClass);
    //return;    
}

function AnnounceRoundStarted()
{
    //return;    
}

event InitGame()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string Options[8388609], ErrorMessage;

    super.InitGame(Options, ErrorMessage);
    //return;    
}

event OnGameReady()
{
    // End:0x2F
    if(!bGameReady)
    {
        bGameReady = true;
        StartHumans();
        StartBots();
    }
    //return;    
}

function EndGame()
{
    local /*0x97E50000-0x00000000*/ private @NULL Winner[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize string Reason[8388609];

    // End:0x0F
    if(bGameEnded)
    {
        return;
    }
    FinalizePRIStats();
    super(GameInfo).EndGame(Winner, Reason);
    RemoveMPActorsDueToEndOfRound();
    // End:0x5C
    if(!bOverTime)
    {
        GotoState('MatchOver');
    }
    //return;    
}

function CheckEndGame()
{
    local /*0x97E50000-0x00000000*/ private @NULL Winner[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize string Reason[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL LPGRI;
    local /*0x97E50000-0x00000000*/ private byte WinCondition;
    local /*0x97E50000-0x00000000*/ private @NULL LPPC;

    LPGRI = LPGRI_Base_MP(WorldInfo.GRI);
    // End:0x24B
    if(Winner == none)
    {
        // End:0x248
        if(LPGRI != none)
        {
            // End:0x217
            if(LPGRI.Winner == none)
            {
                WinCondition = ((int(LPGRI.GameEndCondition.WinCondition) == int(0)) ? 2 : LPGRI.GameEndCondition.WinCondition);
                switch(WinCondition)
                {
                    // End:0x130
                    case 1:
                        Winner = CheckTeamScore();
                        UpdateRoundsWon(Winner);
                        // End:0x214
                        break;
                    // End:0x14C
                    case 2:
                        Winner = CheckPlayerScore();
                        // End:0x214
                        break;
                    // End:0x168
                    case 3:
                        Winner = CheckPlayerKills();
                        // End:0x214
                        break;
                    // End:0x184
                    case 4:
                        Winner = CheckPlayerDeaths();
                        // End:0x214
                        break;
                    // End:0x1B3
                    case 5:
                        Winner = CheckTeamObjectives();
                        UpdateRoundsWon(Winner);
                        // End:0x214
                        break;
                    // End:0x1E2
                    case 6:
                        Winner = CheckTeamLives();
                        UpdateRoundsWon(Winner);
                        // End:0x214
                        break;
                    // End:0x211
                    case 7:
                        Winner = CheckTeamCredits();
                        UpdateRoundsWon(Winner);
                        // End:0x214
                        break;
                    // End:0xFFFF
                    default:
                        break;
                }                
            }
            else
            {
                Winner = PlayerReplicationInfo(LPGRI.Winner);
            }
        }        
    }
    else
    {
        UpdateRoundsWon(Winner);
    }
    // End:0x2AA
    if(LPGRI.Winner == none)
    {
        LPGRI.Winner = Winner;
    }
    // End:0x333
    foreach Class'Engine.WorldInfo'.static.GetWorldInfo().AllControllers(Class'LPPlayerController', LPPC)
    {
        LPPC.ClientSetWinner(LPGRI.Winner);        
    }    
    // End:0x3E4
    if(!super(GameInfo).CheckEndGame(Winner, Reason))
    {
        LPGRI.Winner = none;
        // End:0x3E1
        foreach Class'Engine.WorldInfo'.static.GetWorldInfo().AllControllers(Class'LPPlayerController', LPPC)
        {
            LPPC.ClientSetWinner(none);            
        }        
        return false;
    }
    return true;
    //return ReturnValue;    
}

function CheckTeamScore()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private int TeamIndex, HighestScore, DrawCount;
    local /*0x97E50000-0x00000000*/ private @NULL GRI, Winner;
    local /*0x97E50000-0x00000000*/ private int WinningTeamNumber;

    GRI = WorldInfo.GRI;
    WinningTeamNumber = -1;
    HighestScore = -2147483648;
    DrawCount = 0;
    TeamIndex = 0;
    J0x5C:

    // End:0x1DD [Loop If]
    if(TeamIndex < GRI.Teams.Length)
    {
        // End:0x177
        if(GRI.Teams[TeamIndex].Score > float(HighestScore))
        {
            HighestScore = int(GRI.Teams[TeamIndex].Score);
            WinningTeamNumber = int(GRI.Teams[TeamIndex].GetTeamNum());
            DrawCount = 0;            
        }
        else
        {
            // End:0x1CF
            if(GRI.Teams[TeamIndex].Score == float(HighestScore))
            {
                ++DrawCount;
            }
        }
        ++TeamIndex;
        // [Loop Continue]
        goto J0x5C;
    }
    // End:0x226
    if(WinningTeamNumber >= 0)
    {
        // End:0x209
        if(DrawCount > 0)
        {
            Winner = none;            
        }
        else
        {
            Winner = FindPRIFromTeam(WinningTeamNumber);
        }
    }
    return Winner;
    //return ReturnValue;    
}

function CheckPlayerScore()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], Winner;
    local /*0x97E50000-0x00000000*/ private float HighestScore;
    local /*0x97E50000-0x00000000*/ private @NULL GRI;
    local /*0x97E50000-0x00000000*/ private int I;
    local /*0x97E50000-0x00000000*/ private @NULL LPRI;

    GRI = WorldInfo.GRI;
    HighestScore = -2147484000.0000000;
    I = 0;
    J0x42:

    // End:0x131 [Loop If]
    if(I < GRI.PRIArray.Length)
    {
        LPRI = LPPRI(GRI.PRIArray[I]);
        // End:0xBC
        if(LPRI == none)
        {            
        }
        else
        {
            // End:0x123
            if(LPRI.Score > HighestScore)
            {
                HighestScore = LPRI.Score;
                Winner = LPRI;
            }
        }
        ++I;
        // [Loop Continue]
        goto J0x42;
    }
    return Winner;
    //return ReturnValue;    
}

function CheckPlayerKills()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], Winner;
    local /*0x97E50000-0x00000000*/ private int HighestScore;
    local /*0x97E50000-0x00000000*/ private @NULL GRI;
    local /*0x97E50000-0x00000000*/ private int I;
    local /*0x97E50000-0x00000000*/ private @NULL LPRI;

    GRI = WorldInfo.GRI;
    HighestScore = -2147483648;
    I = 0;
    J0x42:

    // End:0x131 [Loop If]
    if(I < GRI.PRIArray.Length)
    {
        LPRI = LPPRI(GRI.PRIArray[I]);
        // End:0xBC
        if(LPRI == none)
        {            
        }
        else
        {
            // End:0x123
            if(LPRI.KillCount > HighestScore)
            {
                HighestScore = LPRI.KillCount;
                Winner = LPRI;
            }
        }
        ++I;
        // [Loop Continue]
        goto J0x42;
    }
    return Winner;
    //return ReturnValue;    
}

function CheckPlayerDeaths()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], Winner;
    local /*0x97E50000-0x00000000*/ private int HighestScore;
    local /*0x97E50000-0x00000000*/ private @NULL GRI;
    local /*0x97E50000-0x00000000*/ private int I;
    local /*0x97E50000-0x00000000*/ private @NULL LPRI;

    GRI = WorldInfo.GRI;
    HighestScore = 2147483647;
    I = 0;
    J0x42:

    // End:0x131 [Loop If]
    if(I < GRI.PRIArray.Length)
    {
        LPRI = LPPRI(GRI.PRIArray[I]);
        // End:0xBC
        if(LPRI == none)
        {            
        }
        else
        {
            // End:0x123
            if(LPRI.DeathCount < HighestScore)
            {
                HighestScore = LPRI.DeathCount;
                Winner = LPRI;
            }
        }
        ++I;
        // [Loop Continue]
        goto J0x42;
    }
    return Winner;
    //return ReturnValue;    
}

function CheckTeamObjectives()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], Winner, MPGRI;
    local /*0x97E50000-0x00000000*/ private int TeamIndex, MostObjectives, DrawCount, WinningTeamNumber;

    Winner = PlayerReplicationInfo(WorldInfo.GRI.Winner);
    // End:0x260
    if(Winner == none)
    {
        // End:0x240
        if(bDualAttackers)
        {
            MPGRI = LPGRI_Base_MP(WorldInfo.GRI);
            MostObjectives = -1;
            DrawCount = 0;
            TeamIndex = 0;
            J0xB8:

            // End:0x1F4 [Loop If]
            if(TeamIndex < MPGRI.Teams.Length)
            {
                // End:0x1A5
                if(MPGRI.ObjectivesCompleted[TeamIndex] > MostObjectives)
                {
                    MostObjectives = MPGRI.ObjectivesCompleted[TeamIndex];
                    WinningTeamNumber = int(MPGRI.Teams[TeamIndex].GetTeamNum());
                    DrawCount = 0;                    
                }
                else
                {
                    // End:0x1E6
                    if(MPGRI.ObjectivesCompleted[TeamIndex] == MostObjectives)
                    {
                        ++DrawCount;
                    }
                }
                ++TeamIndex;
                // [Loop Continue]
                goto J0xB8;
            }
            // End:0x23D
            if(WinningTeamNumber >= 0)
            {
                // End:0x220
                if(DrawCount > 0)
                {
                    Winner = none;                    
                }
                else
                {
                    Winner = FindPRIFromTeam(WinningTeamNumber);
                }
            }            
        }
        else
        {
            Winner = FindPRIFromTeam(1 - AttackingTeamIndex);
        }
    }
    return Winner;
    //return ReturnValue;    
}

function CheckTeamLives()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private int TeamIndex, MostLives, Lives, DrawCount, WinningTeamNumber;

    local /*0x97E50000-0x00000000*/ private @NULL GRI, Winner;

    GRI = WorldInfo.GRI;
    WinningTeamNumber = -1;
    MostLives = -1;
    DrawCount = 0;
    TeamIndex = 0;
    J0x5C:

    // End:0x18B [Loop If]
    if(TeamIndex < GRI.Teams.Length)
    {
        Lives = LPTeamInfo_MP(GRI.Teams[TeamIndex]).TeamLives;
        // End:0x15B
        if(Lives > MostLives)
        {
            MostLives = Lives;
            WinningTeamNumber = int(GRI.Teams[TeamIndex].GetTeamNum());
            DrawCount = 0;            
        }
        else
        {
            // End:0x17D
            if(Lives == MostLives)
            {
                ++DrawCount;
            }
        }
        ++TeamIndex;
        // [Loop Continue]
        goto J0x5C;
    }
    // End:0x1D4
    if(WinningTeamNumber >= 0)
    {
        // End:0x1B7
        if(DrawCount > 0)
        {
            Winner = none;            
        }
        else
        {
            Winner = FindPRIFromTeam(WinningTeamNumber);
        }
    }
    return Winner;
    //return ReturnValue;    
}

function CheckTeamCredits()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private int TeamIndex, MostCredits, Credits, DrawCount, WinningTeamNumber;

    local /*0x97E50000-0x00000000*/ private @NULL GRI, Winner;

    GRI = WorldInfo.GRI;
    WinningTeamNumber = -1;
    MostCredits = -1;
    DrawCount = 0;
    TeamIndex = 0;
    J0x5C:

    // End:0x18B [Loop If]
    if(TeamIndex < GRI.Teams.Length)
    {
        Credits = LPTeamInfo_MP(GRI.Teams[TeamIndex]).TeamCredits;
        // End:0x15B
        if(Credits > MostCredits)
        {
            MostCredits = Credits;
            WinningTeamNumber = int(GRI.Teams[TeamIndex].GetTeamNum());
            DrawCount = 0;            
        }
        else
        {
            // End:0x17D
            if(Credits == MostCredits)
            {
                ++DrawCount;
            }
        }
        ++TeamIndex;
        // [Loop Continue]
        goto J0x5C;
    }
    // End:0x1D4
    if(WinningTeamNumber >= 0)
    {
        // End:0x1B7
        if(DrawCount > 0)
        {
            Winner = none;            
        }
        else
        {
            Winner = FindPRIFromTeam(WinningTeamNumber);
        }
    }
    return Winner;
    //return ReturnValue;    
}

function UpdateRoundsWon()
{
    local /*0x97E50000-0x00000000*/ private @NULL Winner[8388609], MPGRI;

    // End:0x18B
    if(int(Role) == int(ROLE_Authority))
    {
        MPGRI = LPGRI_Base_MP(GameReplicationInfo);
        // End:0x18B
        if((Winner != none) && MPGRI != none)
        {
            // End:0x128
            if(int(Class'Engine.UIInteraction'.static.GetLocalPlayer(0).Actor.GetTeamNum()) == int(Winner.GetTeamNum()))
            {
                MPGRI.RoundsWonTeam1++;
                MPGRI.WinningTeamByRound[MPGRI.CurrentRound - 1] = 1;                
            }
            else
            {
                MPGRI.RoundsWonTeam2++;
                MPGRI.WinningTeamByRound[MPGRI.CurrentRound - 1] = 2;
            }
        }
    }
    //return;    
}

static function FindPRIFromTeam()
{
    local /*0x97E50000-0x00000000*/ private int TeamNum[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private int J;
    local /*0x97E50000-0x00000000*/ private @NULL WI;

    WI = Class'Engine.WorldInfo'.static.GetWorldInfo();
    J = 0;
    J0x35:

    // End:0x126 [Loop If]
    if(J < WI.GRI.PRIArray.Length)
    {
        // End:0x118
        if(int(WI.GRI.PRIArray[J].GetTeamNum()) == TeamNum)
        {
            return WI.GRI.PRIArray[J];
        }
        ++J;
        // [Loop Continue]
        goto J0x35;
    }
    return none;
    //return ReturnValue;    
}

function FinalizePRIStats()
{
    local /*0x97E50000-0x00000000*/ private @NULL WI, PRI, PlayerPRI;

    WI = Class'Engine.WorldInfo'.static.GetWorldInfo();
    // End:0xB6
    foreach WI.GRI.PRIArray(PRI)
    {
        PlayerPRI = LPPRI(PRI);
        // End:0xB5
        if(PlayerPRI != none)
        {
            PlayerPRI.FinalizeRoundStats();
        }        
    }    
    //return;    
}

function UpdateMutes()
{
    local /*0x97E50000-0x00000000*/ private @NULL C;

    // End:0x48
    foreach WorldInfo.AllControllers(Class'Engine.PlayerController', C)
    {
        UpdateGameplayMuteList(C);        
    }    
    //return;    
}

function StartMatch()
{
    local /*0x97E50000-0x00000000*/ private bool bFireLevelStartup[9437185], bFireLevelBegin;

    true
    true
    GotoState('MatchInProgress');
    UpdateMutes();
    // End:0x13E
    if(((WorldInfo.Game != none) && SPGameInfo(WorldInfo.Game).GameplayEventsWriter != none) && SPGameInfo(WorldInfo.Game).GameplayEventsWriter.IsSessionInProgress())
    {
        SPGameplayEventsWriter(SPGameInfo(WorldInfo.Game).GameplayEventsWriter).LogGameIntEvent(0, 1);
    }
    GameReplicationInfo.RemainingMinute = GameReplicationInfo.RemainingTime;
    Class'LPMultiplayerManager'.static.GetInstance().UpdatePlayerCounts(Class'LPMultiplayerManager'.static.GetInstance().SessionNameGame);
    super.StartMatch(bFireLevelStartup, bFireLevelBegin);
    //return;    
}

function Killed()
{
    local /*0x97E50000-0x00000000*/ private @NULL Killer[8388609], KilledPlayer, KilledPawn;
    local /*0x97E50000-0x00000000*/ private class DamageType[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL KilledPRI;

    KilledPRI = LPPRI(PlayerController(KilledPlayer).PlayerReplicationInfo);
    // End:0x7A
    if(KilledPRI == none)
    {
        KilledPRI = LPPRI(KilledPawn.PlayerReplicationInfo);
    }
    // End:0x2F9
    if(bLogGameplayEvents)
    {
        // End:0x1C0
        if(((WorldInfo.Game != none) && SPGameInfo(WorldInfo.Game).GameplayEventsWriter != none) && SPGameInfo(WorldInfo.Game).GameplayEventsWriter.IsSessionInProgress())
        {
            SPGameplayEventsWriter(SPGameInfo(WorldInfo.Game).GameplayEventsWriter).LogPlayerKillDeath(108, 200, KilledPlayer, DamageType, Killer);
        }
        // End:0x2F9
        if(((WorldInfo.Game != none) && SPGameInfo(WorldInfo.Game).GameplayEventsWriter != none) && SPGameInfo(WorldInfo.Game).GameplayEventsWriter.IsSessionInProgress())
        {
            SPGameplayEventsWriter(SPGameInfo(WorldInfo.Game).GameplayEventsWriter).LogPlayerKillDeath(104, 200, Killer, DamageType, KilledPlayer);
        }
    }
    // End:0x34A
    if(KilledPRI != none)
    {
        KilledPRI.bTappedOut = false;
        KilledPRI.bBledOut = false;
    }
    super(GameInfo).Killed(Killer, KilledPlayer, KilledPawn, DamageType);
    //return;    
}

function NotifyRocketManAward()
{
    local /*0x97E50000-0x00000000*/ private @NULL shooter[8388609], LPPC, PRI;

    LPPC = LPPlayerController(shooter);
    // End:0x6B
    if(LPPC != none)
    {
        PRI = LPPRI(LPPC.PlayerReplicationInfo);
        // End:0x6B
        if(PRI != none)
        {
        }
    }
    //return;    
}

function RestartPlayer()
{
    local /*0x97E50000-0x00000000*/ private @NULL NewPlayer[8388609];
    local /*0x97E50000-0x00000000*/ private name S;
    local /*0x97E50000-0x00000000*/ private @NULL TI, LPP;

    S = NewPlayer.GetStateName();
    super(SPGameInfo).RestartPlayer(NewPlayer);
    // End:0xBD
    if(NewPlayer.PlayerReplicationInfo != none)
    {
        LPPRI(NewPlayer.PlayerReplicationInfo).PerksManager.SetController(LPPlayerController(NewPlayer));
    }
    LPP = LPPlayerPawn(NewPlayer.Pawn);
    // End:0x1FA
    if(LPP != none)
    {
        // End:0x1FA
        if(LPGRI_Base_MP(WorldInfo.GRI).SecondsUntilGameStarts == 0)
        {
            // End:0x1A8
            if(int(Role) == int(ROLE_Authority))
            {
                LPP.SetRemainingDamageImmunityTime(LPP.TuneDataPlayerPawn.PostSpawnInvulnerablilityTime);                
            }
            else
            {
                LPP.ServerSetRemainingDamageImmunityTime(LPP.TuneDataPlayerPawn.PostSpawnInvulnerablilityTime);
            }
        }
    }
    // End:0x3AE
    if(S == 'Dead')
    {
        // End:0x3AE
        if(int(Role) == int(ROLE_Authority))
        {
            TI = LPTeamInfo_MP(WorldInfo.GRI.Teams[int(NewPlayer.GetTeamNum())]);
            // End:0x3AE
            if((TI != none) && TI.TeamLives >= 0)
            {
                // End:0x2E9
                if(TI.TeamLives == 0)
                {                    
                }
                else
                {
                    --TI.TeamLives;
                    TI.UpdateRespawnCounters();
                    // End:0x3AE
                    if(TI.TeamLives == Class'LPTuneDataMapInfoMP'.static.GetLowRespawnThreshold())
                    {
                        Class'LPTuneDataMapInfoMP'.static.BroadcastAnnouncement(8,, int(TI.GetTeamNum()));
                    }
                }
            }
        }
    }
    //return;    
}

function PlayerCanRestart()
{
    local /*0x97E50000-0x00000000*/ private @NULL aPlayer[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], bCanRestartPlayer;
    local /*0x97E50000-0x00000000*/ private @NULL LPC, TI;

    bCanRestartPlayer = super(GameInfo).PlayerCanRestart(aPlayer);
    // End:0x2F
    if(!bCanRestartPlayer)
    {
        return false;
    }
    LPC = LPPlayerController(aPlayer);
    // End:0x5C
    if(LPC == none)
    {
        return true;
    }
    TI = LPTeamInfo_MP(WorldInfo.GRI.Teams[int(aPlayer.GetTeamNum())]);
    // End:0x123
    if(TI != none)
    {
        // End:0x121
        if((TI.GetRemainingLives() < 0) || TI.GetRemainingLives() > 0)
        {
            return true;
        }
        return false;
    }
    return true;
    //return ReturnValue;    
}

function GenericPlayerInitialization()
{
    local /*0x97E50000-0x00000000*/ private @NULL C[8388609], PC;
    local /*0x97E50000-0x00000000*/ private int I;

    super.GenericPlayerInitialization(C);
    PC = LPPlayerController(C);
    // End:0x28C
    if(PC != none)
    {
        // End:0x200
        if((NetConnection(PC.Player) != none) && ChildConnection(PC.Player) == none)
        {
            I = 0;
            J0xA5:

            // End:0x152 [Loop If]
            if(I < SeekFreeMultiClassLoader.LoadedClasses.Length)
            {
                PC.bSkinsLoaded = false;
                PC.ClientLoadCharacter(PathName(SeekFreeMultiClassLoader.LoadedClasses[I]));
                I++;
                // [Loop Continue]
                goto J0xA5;
            }
            I = 0;
            J0x15D:

            // End:0x200 [Loop If]
            if(I < SeekFreeMultiClassLoader.PendingClasses.Length)
            {
                PC.bSkinsLoaded = false;
                PC.ClientLoadCharacter(SeekFreeMultiClassLoader.PendingClasses[I]);
                I++;
                // [Loop Continue]
                goto J0x15D;
            }
        }
        // End:0x26D
        if(PC.PlayerReplicationInfo.Team != none)
        {
            SetPlayerClass(PC, int(PC.GetTeamNum()));
        }
        PC.ClientRegisterWithParty();
    }
    //return;    
}

event HandleSeamlessTravelPlayer()
{
    local /*0x97E50000-0x00000000*/ private @NULL C[25165825], GPRI;
    local /*0x97E50000-0x00000000*/ private int TeamNum;
    local /*0x97E50000-0x00000000*/ private @NULL LPPC;

    C.PlayerReplicationInfo.bOnlySpectator = false;
    GPRI = LPPRI(C.PlayerReplicationInfo);
    LPPC = LPPlayerController(C);
    // End:0x221
    if(LPPC != none)
    {
        TeamNum = LPPC.PickedTeamNum;
        // End:0x11C
        if(LPPC.DesiredNevecPawnClassName != "")
        {
            GPRI.DesiredNevecPawnClassName = LPPC.DesiredNevecPawnClassName;
        }
        // End:0x17E
        if(LPPC.DesiredPiratePawnClassName != "")
        {
            GPRI.DesiredPiratePawnClassName = LPPC.DesiredPiratePawnClassName;
        }
        // End:0x221
        if(LPPC.PlayerReplicationInfo.bOnlySpectator)
        {
            LPPC.PlayerReplicationInfo.bOnlySpectator = false;
            LPPC.PlayerReplicationInfo.bOutOfLives = false;
        }
    }
    super(GameInfo).HandleSeamlessTravelPlayer(C);
    ChangeTeam(C, TeamNum, false);
    // End:0x2A2
    if((GPRI != none) && GPRI.PawnClass == none)
    {
        SetPlayerClass(C, TeamNum);
    }
    //return;    
}

function SetGameRules()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL MyGameSettings, TD;

    super.SetGameRules();
    MyGameSettings = LPOnlineGameSettings(GetGameSettingsObject());
    // End:0x38
    if(MyGameSettings == none)
    {
        return false;
    }
    // End:0x86
    if(MyGameSettings.GetRoundsToWin() > 0)
    {
        RoundsToWin = MyGameSettings.GetRoundsToWin();
    }
    // End:0xAC
    if(MyGameSettings.TuneDataOnlineGameSettings == none)
    {
        return false;
    }
    TD = LPTuneDataOnlineGameSettings(MyGameSettings.TuneDataOnlineGameSettings.FindParameterSet(name(WorldInfo.GetMapName()), true, MyGameSettings));
    // End:0x19B
    if(TD == none)
    {
        TD = LPTuneDataOnlineGameSettings(MyGameSettings.TuneDataOnlineGameSettings.FindParameterSet('Default', false, MyGameSettings));
        // End:0x19B
        if(TD == none)
        {
            return false;
        }
    }
    EnemyProximityToSpawn = TD.EnemyProximityToSpawn;
    TeammateProximityToSpawn = TD.TeammateProximityToSpawn;
    MinimumProximityToSpawn = TD.MinimumProximityToSpawn;
    SpawnRatingBucket_Excellent = TD.SpawnRatingBucket_Excellent;
    SpawnRatingBucket_Good = TD.SpawnRatingBucket_Good;
    SpawnRatingBucket_Acceptable = TD.SpawnRatingBucket_Acceptable;
    SpawnRatingBucket_Poor = TD.SpawnRatingBucket_Poor;
    SpawnRatingWeight_Excellent = TD.SpawnRatingWeight_Excellent;
    SpawnRatingWeight_Good = TD.SpawnRatingWeight_Good;
    SpawnRatingWeight_Acceptable = TD.SpawnRatingWeight_Acceptable;
    SpawnRatingWeight_Poor = TD.SpawnRatingWeight_Poor;
    SpawnRuleValue_TeammateProximity = TD.SpawnRuleValue_TeammateProximity;
    SpawnRuleValue_PrimarySpawn = TD.SpawnRuleValue_PrimarySpawn;
    SpawnRuleValue_LargeTeammatePresence = TD.SpawnRuleValue_LargeTeammatePresence;
    SpawnRuleValue_SpawnOwner = TD.SpawnRuleValue_SpawnOwner;
    SpawnRuleValue_VisibleToTeammate = TD.SpawnRuleValue_VisibleToTeammate;
    SpawnRuleValue_LargeEnemyPresence = TD.SpawnRuleValue_LargeEnemyPresence;
    SpawnRuleValue_EnemyProximity = TD.SpawnRuleValue_EnemyProximity;
    SpawnRuleValue_VisibleToEnemy = TD.SpawnRuleValue_VisibleToEnemy;
    SpawnRuleValue_Telefrag = TD.SpawnRuleValue_Telefrag;
    SpawnRuleValue_SpawnDisabled = TD.SpawnRuleValue_SpawnDisabled;
    bIncapacitatePlayerOnDeath = TD.bIncapacitatePlayerOnDeath;
    bScoreAkridKill = TD.bScoreAkridKill;
    bTeamScoreAkridKill = TD.bTeamScoreAkridKill;
    bScorePlayerKill = TD.bScorePlayerKill;
    bTeamScorePlayerKill = TD.bTeamScorePlayerKill;
    bScorePlayerSuicide = TD.bScorePlayerSuicide;
    bTeamScorePlayerSuicide = TD.bTeamScorePlayerSuicide;
    bPlayerDeathAffectsScore = TD.bPlayerDeathAffectsScore;
    bPlayerDeathAffectsTeamScore = TD.bPlayerDeathAffectsTeamScore;
    bAllowNegativePlayerScore = TD.bAllowNegativePlayerScore;
    bAllowNegativeTeamScore = TD.bAllowNegativeTeamScore;
    bThermalPickupsAccumulateTeamScore = TD.bThermalPickupsAccumulateTeamScore;
    bThermalPickupsAccumulateScore = TD.bThermalPickupsAccumulateScore;
    bThermalExtractionAccumulateTeamScore = TD.bThermalExtractionAccumulateTeamScore;
    bThermalExtractionAccumulateScore = TD.bThermalExtractionAccumulateScore;
    return true;
    //return ReturnValue;    
}

function BroadcastHUDMessage()
{
    local /*0x97E50000-0x00000000*/ private int TeamIndex[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize string MessageBodyPrefix[142606337], MessageBodyPostfix, ObjectiveName;
    local /*0x97E50000-0x00000000*/ private @NULL PRI1[8388609];
    local /*0x97E50000-0x00000000*/ private float fDisplayTime[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL B;

    B = LPBroadcastHandler(BroadcastHandler);
    // End:0x80
    if(B != none)
    {
        B.BroadcastHUDMessage(TeamIndex, MessageBodyPrefix, MessageBodyPostfix, ObjectiveName, PRI1, fDisplayTime);
    }
    //return;    
}

function BroadcastObjectiveMessage()
{
    local /*0x97E50000-0x00000000*/ private int TeamIndex[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize string EventName[142606337], ObjectiveName;
    local /*0x97E50000-0x00000000*/ private int ObjectiveType[8388609];
    local /*0x97E50000-0x00000000*/ private bool bPrimary[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PRI1[8388609];
    local /*0x97E50000-0x00000000*/ private float fDisplayTime[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL B;

    B = LPBroadcastHandler(BroadcastHandler);
    // End:0x8A
    if(B != none)
    {
        B.BroadcastObjectiveMessage(TeamIndex, EventName, ObjectiveName, ObjectiveType, bPrimary, PRI1, fDisplayTime);
    }
    //return;    
}

function Login()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string Portal[8388609], Options;
    local /*0x97E50000-0x00000000*/ private @NULL UniqueId[8519681];
    local /*0x97E50000-0x00000000*/ private editfixedsize string ErrorMessage[25165825];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], PC, LPC;

    PC = super.Login(Portal, Options, UniqueId, ErrorMessage);
    LPC = LPPlayerController(PC);
    // End:0x9A
    if((LPC != none) && LPC.bIsPlayer)
    {
        PlacePlayerOnSmallestTeam(LPC);
    }
    return PC;
    //return ReturnValue;    
}

function CountPlayersOnTeam()
{
    local /*0x97E50000-0x00000000*/ private @NULL Team[8388609], Ignore;
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689], Idx, Count;

    Count = 0;
    Idx = 0;
    J0x16:

    // End:0xCC [Loop If]
    if(Idx < Team.TeamMembers.Length)
    {
        // End:0x7C
        if(Team.TeamMembers[Idx] == Ignore)
        {            
        }
        else
        {
            // End:0xBE
            if(LPPlayerController(Team.TeamMembers[Idx]) != none)
            {
                Count++;
            }
        }
        Idx++;
        // [Loop Continue]
        goto J0x16;
    }
    return Count;
    //return ReturnValue;    
}

function PlacePlayerOnSmallestTeam()
{
    local /*0x97E50000-0x00000000*/ private @NULL NewPlayer[8388609];
    local /*0x97E50000-0x00000000*/ private int Idx, SmallestTeam, NumTeamsToTest;

    SmallestTeam = 0;
    NumTeamsToTest = int(NumTeams);
    // End:0x3C
    if(NumTeamsToTest > 2)
    {
        NumTeamsToTest = 2;
    }
    Idx = 1;
    J0x47:

    // End:0xD0 [Loop If]
    if(Idx < NumTeamsToTest)
    {
        // End:0xC2
        if((CountPlayersOnTeam(Teams[Idx], NewPlayer)) < (CountPlayersOnTeam(Teams[SmallestTeam], NewPlayer)))
        {
            SmallestTeam = Idx;
        }
        Idx++;
        // [Loop Continue]
        goto J0x47;
    }
    ChangeTeam(NewPlayer, SmallestTeam, false);
    //return;    
}

function PlacePlayerOnAssignedTeam()
{
    local /*0x97E50000-0x00000000*/ private @NULL PC[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL MPMgr, ZeroId;
    local /*0x97E50000-0x00000000*/ private int TeamNum;

    MPMgr = Class'LPMultiplayerManager'.static.GetInstance();
    // End:0xAB
    if(((PC == none) || PC.PlayerReplicationInfo == none) || EqualEqual_UniqueNetIdUniqueNetId(PC.PlayerReplicationInfo.UniqueId, ZeroId))
    {
        return false;
    }
    TeamNum = MPMgr.HostReservationBeacon.GetTeamForCurrentPlayer(PC.PlayerReplicationInfo.UniqueId);
    // End:0x148
    if(TeamNum < 0)
    {
        TeamNum = AttemptMissingPlayerReservation(PC);
    }
    // End:0x159
    if(TeamNum < 0)
    {
        return false;
    }
    // End:0x1DB
    if((TeamNum < Teams.Length) && Teams[TeamNum] != PC.PlayerReplicationInfo.Team)
    {
        ChangeTeam(PC, TeamNum, false);
    }
    return true;
    //return ReturnValue;    
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
    // End:0x2B6
    if(NotEqual_UniqueNetIdUniqueNetId(LPPRI(PC.PlayerReplicationInfo).PartyOwnerUniqueId, ZeroId))
    {
        // End:0x1CF
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

function GetMatchData()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], DataStoreManager;

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
    return MatchDataStore;
    //return ReturnValue;    
}

function InitRoundInfo()
{
    local /*0x97E50000-0x00000000*/ private @NULL MPGRI;
    local /*0x97E50000-0x00000000*/ private int Idx;

    MPGRI = LPGRI_Base_MP(GameReplicationInfo);
    // End:0x336
    if(MPGRI != none)
    {
        GetMatchData();
        MatchDataStore.MatchRounds++;
        MPGRI.RoundsToWin = RoundsToWin;
        MPGRI.CurrentRound = MatchDataStore.MatchRounds;
        MPGRI.RoundsWonTeam1 = MatchDataStore.MatchRoundsWon;
        MPGRI.RoundsWonTeam2 = MatchDataStore.MatchRoundsLost;
        Idx = 0;
        J0x13F:

        // End:0x1D3 [Loop If]
        if(Idx < MatchDataStore.MatchWinsByRound.Length)
        {
            MPGRI.WinningTeamByRound[Idx] = ((MatchDataStore.MatchWinsByRound[Idx]) ? 1 : 2);
            Idx++;
            // [Loop Continue]
            goto J0x13F;
        }
        MPGRI.Team1Index = GetLocalPlayerTeamNum();
        // End:0x336
        if(((WorldInfo.Game != none) && SPGameInfo(WorldInfo.Game).GameplayEventsWriter != none) && SPGameInfo(WorldInfo.Game).GameplayEventsWriter.IsSessionInProgress())
        {
            SPGameplayEventsWriter(SPGameInfo(WorldInfo.Game).GameplayEventsWriter).LogGameIntEvent(2, MPGRI.CurrentRound);
        }
    }
    //return;    
}

function SetRoundsToWin()
{
    local /*0x97E50000-0x00000000*/ private int NumRounds[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL MyGameSettings, MPGRI;

    MyGameSettings = LPOnlineGameSettings(GetGameSettingsObject());
    // End:0x2E
    if(MyGameSettings == none)
    {
        return;
    }
    MPGRI = LPGRI_Base_MP(GameReplicationInfo);
    // End:0x5B
    if(MPGRI == none)
    {
        return;
    }
    RoundsToWin = NumRounds;
    MyGameSettings.SetRoundsToWin(NumRounds);
    MPGRI.RoundsToWin = NumRounds;
    //return;    
}

function HandleRoundStats()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPC;
    local /*0x97E50000-0x00000000*/ private int WinningTeamNum, MatchWinningTeamNum, HostTeamNum;
    local /*0x97E50000-0x00000000*/ private bool bMatchOver;
    local /*0x97E50000-0x00000000*/ private int Idx;

    GetMatchData();
    MatchDataStore.MatchTimeInSeconds += (GetElapsedTime());
    WinningTeamNum = GetWinningTeamNum();
    HostTeamNum = GetLocalPlayerTeamNum();
    // End:0xD8
    if(HostTeamNum == WinningTeamNum)
    {
        MatchDataStore.MatchWinsByRound[MatchDataStore.MatchRounds - 1] = true;
        MatchDataStore.MatchRoundsWon++;        
    }
    else
    {
        // End:0x154
        if((1 - HostTeamNum) == WinningTeamNum)
        {
            MatchDataStore.MatchWinsByRound[MatchDataStore.MatchRounds - 1] = false;
            MatchDataStore.MatchRoundsLost++;
        }
    }
    bMatchOver = IsMatchComplete();
    // End:0x2F2
    if(bMatchOver)
    {
        MatchWinningTeamNum = GetMatchWinningTeamNum();
        AwardCommendations();
        FinalizeScores(MatchWinningTeamNum);
        // End:0x2F1
        foreach WorldInfo.AllControllers(Class'LPPlayerController', LPC)
        {
            // End:0x28C
            if(!LPC.IsLocalPlayerController())
            {
                Idx = 0;
                J0x20A:

                // End:0x28C [Loop If]
                if(Idx < MatchDataStore.MatchScores.Length)
                {
                    LPC.AddScoreStruct(MatchDataStore.MatchScores[Idx]);
                    Idx++;
                    // [Loop Continue]
                    goto J0x20A;
                }
            }
            LPC.MatchOver(MatchWinningTeamNum, MatchDataStore.MatchTimeInSeconds, MatchDataStore.MatchRounds);            
        }        
    }
    //return;    
}

function GetElapsedTime()
{
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];

    return ((GameReplicationInfo == none) ? 0 : GameReplicationInfo.ElapsedTime);
    //return ReturnValue;    
}

function GetLocalPlayerTeamNum()
{
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];

    return int(Class'Engine.UIInteraction'.static.GetLocalPlayer(0).Actor.GetTeamNum());
    //return ReturnValue;    
}

function GetWinningTeamNum()
{
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL GRI;

    GRI = LPGRI_Base_MP(GetGRI());
    // End:0x109
    if(GRI != none)
    {
        // End:0x9C
        if(LPTeamInfo_MP(GRI.Winner) != none)
        {
            return int(LPTeamInfo_MP(GRI.Winner).GetTeamNum());            
        }
        else
        {
            // End:0x109
            if(LPPRI(GRI.Winner) != none)
            {
                return int(LPPRI(GRI.Winner).GetTeamNum());
            }
        }
    }
    return -1;
    //return ReturnValue;    
}

function GetMatchWinningTeamNum()
{
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL GRI;

    GRI = LPGRI_Base_MP(GetGRI());
    // End:0x150
    if(GRI != none)
    {
        // End:0xBE
        if(GRI.RoundsWonTeam1 > GRI.RoundsWonTeam2)
        {
            return int(Class'Engine.UIInteraction'.static.GetLocalPlayer(0).Actor.GetTeamNum());            
        }
        else
        {
            // End:0x150
            if(GRI.RoundsWonTeam1 < GRI.RoundsWonTeam2)
            {
                return 1 - int(Class'Engine.UIInteraction'.static.GetLocalPlayer(0).Actor.GetTeamNum());
            }
        }
    }
    return -1;
    //return ReturnValue;    
}

function AwardCommendations()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize array CommendationList;
    local /*0x97E50000-0x00000000*/ private @NULL Commendation;

    CommendationList = LPPlayerController(Class'Engine.UIInteraction'.static.GetLocalPlayer(0).Actor).GetAwardManager().GetAwardsOfClass(Class'LPCommendation');
    // End:0xBD
    foreach CommendationList(Commendation)
    {
        LPCommendation(Commendation).HandleCommendation();        
    }    
    //return;    
}

function FinalizeScores()
{
    local /*0x97E50000-0x00000000*/ private int WinningTeamNum[8388609];
    local /*0x97E50000-0x00000000*/ private byte GameType;
    local /*0x97E50000-0x00000000*/ private @NULL LPC, PRI;

    GetMatchData();
    GameType = byte(GetGameSettingsObject().GetGameType());
    // End:0x29F
    foreach WorldInfo.AllControllers(Class'LPPlayerController', LPC)
    {
        LPC.AwardMatchCompletionBonus(MatchCompletionBonus);
        PRI = LPPRI(LPC.PlayerReplicationInfo);
        MatchDataStore.AddScoreEntry(PRI.UniqueId, PRI.GetHumanReadableName(), LPC.GetMetagameManager().GetMetagameRank(), int(PRI.GetTeamNum()), LPC.EvalStat('Stat_Kills', 1) + ((int(GameType) == int(4)) ? LPC.EvalStat('Stat_KillsAkrid', 1) : 0), LPC.EvalStat('Stat_Deaths', 1), LPC.EvalStat('Stat_Assists', 1), LPC.EvalStat('Stat_Revives', 1), PRI.GetMPCreditsEarnedInRound(), LPC.IsLocalPlayerController());        
    }    
    //return;    
}

function CanSpawnPlayers()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x11
    if(!bGameReady)
    {
        return false;
    }
    return true;
    //return ReturnValue;    
}

function StartTheGame()
{
    //return;    
}

function IsMatchComplete()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL MPGRI;

    MPGRI = LPGRI_Base_MP(GameReplicationInfo);
    // End:0x4B
    if(MPGRI != none)
    {
        return MPGRI.IsMatchComplete();
    }
    return false;
    //return ReturnValue;    
}

function RegisterServer()
{
    local /*0x97E50000-0x00000000*/ private byte LoginStatus;
    local /*0x97E50000-0x00000000*/ private @NULL MPMgr;

    MPMgr = Class'LPMultiplayerManager'.static.GetInstance();
    // End:0x10A
    if(int(WorldInfo.NetMode) == int(NM_DedicatedServer))
    {
        LoginStatus = OnlineSub.PlayerInterface.GetLoginStatus(byte(MPMgr.OwningControllerIndex));
        // End:0xE9
        if(int(LoginStatus) == int(2))
        {
            MPMgr.SetOnlineMode(1);            
        }
        else
        {
            MPMgr.SetOnlineMode(2);
        }
    }
    // End:0x1AF
    if(((int(WorldInfo.NetMode) == int(NM_ListenServer)) || int(WorldInfo.NetMode) == int(NM_DedicatedServer)) && GameInterface.GetGameSettings('Game') == none)
    {
        MPMgr.HostGame();
    }
    //return;    
}

function UpdateGameSettings()
{
    local /*0x97E50000-0x00000000*/ private @NULL GameSettings, MPGRI;
    local /*0x97E50000-0x00000000*/ private int RemainingTime;

    // End:0x22
    if(EqualEqual_InterfaceInterface(GameInterface, OnlineGameInterface(none)))
    {
        return;
    }
    GameSettings = LPOnlineGameSettings(GameInterface.GetGameSettings('Game'));
    // End:0x6F
    if(GameSettings == none)
    {
        return;
    }
    MPGRI = LPGRI_Base_MP(GameReplicationInfo);
    // End:0x159
    if((int(GameSettings.GetMatchState()) == int(1)) && MPGRI != none)
    {
        RemainingTime = ((RoundsToWin - MPGRI.CurrentRound) * TimeLimit) * 60;
        RemainingTime += MPGRI.RemainingTime;
        GameSettings.SetTimeRemaining(RemainingTime);
    }
    //return;    
}

static function StopLoadingOrClientMovie()
{
    local /*0x97E50000-0x00000000*/ private @NULL SPPC[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize string MovieName;

    SPPC.GetCurrentMovie(MovieName);
    // End:0x8F
    if((MovieName ~= "") && MovieName ~= Class'Engine.Engine'.static.GetCurrentLoadingMovie())
    {
        SPPC.ClientShowLoadingMovie(false, false);        
    }
    else
    {
        SPPC.ClientStopMovie(0.0000000, false, true, true);
    }
    //return;    
}

function GetTGSOverrideTeam()
{
    local /*0x97E50000-0x00000000*/ private @NULL C[8388609];
    local /*0x97E50000-0x00000000*/ private int TeamNbr[25165825];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL MPGRI;
    local /*0x97E50000-0x00000000*/ private editfixedsize string Prefix;

    // End:0x11
    if(C == none)
    {
        return false;
    }
    Prefix = Left(C.PlayerReplicationInfo.PlayerName, 2);
    // End:0x86
    if((Prefix == "A ") || Prefix == "a ")
    {
        TeamNbr = 0;        
    }
    else
    {
        // End:0xBA
        if((Prefix == "B ") || Prefix == "b ")
        {
            TeamNbr = 1;            
        }
        else
        {
            return false;
        }
    }
    MPGRI = LPGRI_Base_MP(GameReplicationInfo);
    // End:0x136
    if((MPGRI != none) && MPGRI.CurrentRound == 2)
    {
        // End:0x12B
        if(TeamNbr == 1)
        {
            TeamNbr = 0;            
        }
        else
        {
            TeamNbr = 1;
        }
    }
    return true;
    //return ReturnValue;    
}

event GetSeamlessTravelActorList()
{
    local /*0x97E50000-0x00000000*/ private bool bToEntry[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize array ActorList[25165825];

    super(GameInfo).GetSeamlessTravelActorList(bToEntry, ActorList);
    // End:0x5B
    if(bToEntry && SeekFreeMultiClassLoader != none)
    {
        SeekFreeMultiClassLoader.UnloadAll(true);
    }
    //return;    
}

function UpdateNetFrequencies()
{
    local /*0x97E50000-0x00000000*/ private int Freq[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PC, PWN;

    NetFrequencyOverride = Freq;
    // End:0x72
    foreach WorldInfo.AllControllers(Class'LPPlayerController', PC)
    {
        PC.NetUpdateFrequency = float(NetFrequencyOverride);        
    }    
    // End:0xD4
    foreach WorldInfo.AllPawns(Class'LPPawn', PWN)
    {
        PWN.NetUpdateFrequency = float(NetFrequencyOverride);        
    }    
    //return;    
}

state MatchInProgress
{
    function MatchIsInProgress()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        // End:0x1E
        if(bGameEnded || bOverTime)
        {
            return false;
        }
        // End:0x55
        if((TimeLimit > 0) && GameReplicationInfo.RemainingTime <= 0)
        {
            return false;
        }
        return true;
        //return ReturnValue;        
    }

    function Timer()
    {
        local /*0x97E50000-0x00000000*/ private int TimeLimitSeconds;

        global.Timer();
        // End:0xC7
        if(!bGameEnded)
        {
            // End:0x4E
            if(bOverTime)
            {
                // End:0x4B
                if(!SendGameTimeExpiredEvent())
                {
                    EndGame(none, "TimeLimit");
                }                
            }
            else
            {
                // End:0xC7
                if(TimeLimit > 0)
                {
                    GameReplicationInfo.bStopCountDown = false;
                    // End:0xC7
                    if(GameReplicationInfo.RemainingTime <= 0)
                    {
                        // End:0xC7
                        if(!SendGameTimeExpiredEvent())
                        {
                            EndGame(none, "TimeLimit");
                        }
                    }
                }
            }
        }
        TimeLimitSeconds = (TimeLimit * 60) + LPGRI_Base_MP(GameReplicationInfo).TimeAdded;
        // End:0x22D
        if(GameReplicationInfo.RemainingTime > 0)
        {
            // End:0x182
            if(GameReplicationInfo.ElapsedTime == (TimeLimitSeconds / 2))
            {
                Class'LPTuneDataMapInfoMP'.static.BroadcastAnnouncement(2);                
            }
            else
            {
                // End:0x1E4
                if(GameReplicationInfo.ElapsedTime == (TimeLimitSeconds - (TimeLimitSeconds / 4)))
                {
                    Class'LPTuneDataMapInfoMP'.static.BroadcastAnnouncement(3);                    
                }
                else
                {
                    // End:0x22D
                    if(GameReplicationInfo.RemainingTime == 60)
                    {
                        Class'LPTuneDataMapInfoMP'.static.BroadcastAnnouncement(4);
                    }
                }
            }
        }
        //return;        
    }

    function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];
        local /*0x97E50000-0x00000000*/ private @NULL PRI;

        super(SPStateObject).BeginState(PreviousStateName);
        LPGRI_Base_MP(GetGRI()).SetGameStatus(3);
        InitRoundInfo();
        // End:0xC6
        if(PreviousStateName != 'RoundOver')
        {
            // End:0x99
            foreach DynamicActors(Class'Engine.PlayerReplicationInfo', PRI)
            {
                PRI.StartTime = 0;                
            }            
            GameReplicationInfo.ElapsedTime = 0;
            bWaitingToStartMatch = false;
        }
        // End:0xFE
        if(RoundStartAnnouncementDelay > float(0))
        {
            self.SetTimer(RoundStartAnnouncementDelay, false, 'AnnounceRoundStarted');            
        }
        else
        {
            AnnounceRoundStarted();
        }
        //return;        
    }
    stop;    
}

state MatchOver
{
    ignores RestartPlayer, ScoreKill;

    function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];
        local /*0x97E50000-0x00000000*/ private @NULL GameSettings, MPManager, P;

        // End:0x63
        if((int(WorldInfo.NetMode) == int(NM_DedicatedServer)) || int(WorldInfo.NetMode) == int(NM_ListenServer))
        {
            // End:0x63
            if(bLevelChange)
            {
                return;
            }
        }
        super.BeginState(PreviousStateName);
        GameReplicationInfo.bStopCountDown = true;
        // End:0xED
        foreach WorldInfo.AllPawns(Class'Engine.Pawn', P)
        {
            P.TurnOff();            
        }        
        HandleRoundStats();
        LPGRI_Base_MP(GetGRI()).SetGameStatus(5);
        // End:0x27D
        if((int(WorldInfo.NetMode) == int(NM_DedicatedServer)) || int(WorldInfo.NetMode) == int(NM_ListenServer))
        {
            // End:0x269
            if(NotEqual_InterfaceInterface(GameInterface, OnlineGameInterface(none)))
            {
                MPManager = Class'LPMultiplayerManager'.static.GetInstance();
                GameSettings = LPOnlineGameSettings(GameInterface.GetGameSettings(MPManager.SessionNameGame));
                // End:0x269
                if(GameSettings != none)
                {
                    GameSettings.SetMatchState(3);
                    MPManager.UpdateGameSettings(GameSettings);
                }
            }
            ClearTimer('UpdateGameSettings');
        }
        //return;        
    }

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        // End:0x63
        if(IsMatchComplete())
        {
            // End:0x63
            if(LPGRI_Base_MP(GameReplicationInfo).RoundsWonTeam1 > LPGRI_Base_MP(GameReplicationInfo).RoundsWonTeam2)
            {                
            }
        }
        //return;        
    }

    function MatchIsInProgress()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        return false;
        //return ReturnValue;        
    }

    function ResetLevel()
    {
        bChangeLevels = false;
        bUseSeamlessTravel = true;
        RestartGame();
        //return;        
    }

    function ReduceDamage()
    {
        local /*0x97E50000-0x00000000*/ private int Damage[25165825];
        local /*0x97E50000-0x00000000*/ private @NULL injured[8388609], InstigatedBy, HitLocation, Momentum;
        local /*0x97E50000-0x00000000*/ private class DamageType[8388609];
        local /*0x97E50000-0x00000000*/ private @NULL DamageCauser[8388609];

        Damage = 0;
        Momentum = vect(0.0000000, 0.0000000, 0.0000000);
        //return;        
    }

    function ChangeTeam()
    {
        local /*0x97E50000-0x00000000*/ private @NULL Other[8388609];
        local /*0x97E50000-0x00000000*/ private int Num[8388609];
        local /*0x97E50000-0x00000000*/ private bool bNewTeam[8388609], ReturnValue;

        Other.PlayerReplicationInfo.bOutOfLives = true;
        return true;
        //return ReturnValue;        
    }

    event PostLogin()
    {
        local /*0x97E50000-0x00000000*/ private @NULL NewPlayer[8388609];

        global.PostLogin(NewPlayer);
        NewPlayer.GameHasEnded(WorldInfo.GRI.Winner);
        //return;        
    }
    stop;    
}

auto state PendingMatch
{
    event BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        LPGRI_Base_MP(GetGRI()).SetGameStatus(1);
        super.BeginState(PreviousStateName);
        //return;        
    }

    event OnGameReady()
    {
        // End:0x1B
        if(!bGameReady)
        {
            bGameReady = true;
        }
        //return;        
    }

    function CanSpawnPlayers()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        return false;
        //return ReturnValue;        
    }

    function SetPlayerClass()
    {
        local /*0x97E50000-0x00000000*/ private @NULL Other[8388609];
        local /*0x97E50000-0x00000000*/ private int N[8388609];
        local /*0x97E50000-0x00000000*/ private @NULL PRI, OtherPC;

        OtherPC = LPPlayerController(Other);
        PRI = LPPRI(Other.PlayerReplicationInfo);
        // End:0xA9
        if(OtherPC != none)
        {
            SetPlayerClassFromPlayerSelection(OtherPC, PRI, N, PRI.GetDesiredPawnClass(N));
        }
        //return;        
    }

    function ChangeTeam()
    {
        local /*0x97E50000-0x00000000*/ private @NULL Other[8388609];
        local /*0x97E50000-0x00000000*/ private int N[8388609];
        local /*0x97E50000-0x00000000*/ private bool bNewTeam[8388609], ReturnValue;

        return super(SPGameInfo).ChangeTeam(Other, N, bNewTeam);
        //return ReturnValue;        
    }

    function GetNumConnections()
    {
        local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];
        local /*0x97E50000-0x00000000*/ private @NULL PlayersList;

        PlayersList = OnlineRecentPlayersList(OnlineSub.GetNamedInterface('RecentPlayersList'));
        // End:0x55
        if(PlayersList == none)
        {
            return GetNumPlayers();
        }
        return PlayersList.GetCurrentPlayersListCount();
        //return ReturnValue;        
    }

    function CheckIfEveryoneReady()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
        local /*0x97E50000-0x00000000*/ private @NULL PC;
        local /*0x97E50000-0x00000000*/ private int TotalPlayers, TotalPlayersReady, TotalControllers;

        TotalPlayers = GetNumConnections();
        TotalPlayersReady = 0;
        // End:0x46
        if(SeekFreeMultiClassLoader.PendingClasses.Length > 0)
        {
            return false;
        }
        TotalControllers = 0;
        // End:0x197
        foreach WorldInfo.AllControllers(Class'LPPlayerController', PC)
        {
            // End:0xD3
            if(WorldInfo.TimeSeconds > (MapInfoStartTime + float(30)))
            {
                // End:0xD3
                if(LPPreGameLobbyPC(PC) != none)
                {
                    continue;                    
                }
            }
            TotalControllers++;
            // End:0x108
            if(!PC.HasClientLoadedCurrentWorld())
            {                
                return false;                
            }
            else
            {
                // End:0x18B
                if((NetConnection(PC.Player) != none) && ChildConnection(PC.Player) == none)
                {
                    // End:0x18B
                    if(!PC.bSkinsLoaded)
                    {                        
                        return false;
                    }
                }
            }
            TotalPlayersReady++;            
        }        
        // End:0x1AF
        if(TotalControllers < TotalPlayers)
        {
        }
        // End:0x1C8
        if(TotalPlayersReady >= TotalControllers)
        {
            return true;
        }
        return false;
        //return ReturnValue;        
    }

    function StartTheGame()
    {
        // End:0x4B
        if(!bGameReady || SeekFreeMultiClassLoader.PendingClasses.Length > 0)
        {
            SetTimer(5.0000000, false, 'StartTheGame');
            return;
        }
        StartMatch();
        //return;        
    }

    function ShouldDelayPawnSpawningUntilMPReady()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
        local /*0x97E50000-0x00000000*/ private @NULL MapInfo;

        MapInfo = LPMapInfo_MP(WorldInfo.GetMapInfo());
        // End:0x6B
        if((MapInfo == none) || MapInfo.bDelayPawnSpawningUntilMPGameReady == false)
        {
            return false;
        }
        return true;
        //return ReturnValue;        
    }

    function StartMatch()
    {
        local /*0x97E50000-0x00000000*/ private bool bFireLevelStartup[9437185], bFireLevelBegin;

        true
        true
        bStartingMatch = true;
        super.StartMatch(bFireLevelStartup, bFireLevelBegin);
        bStartingMatch = false;
        //return;        
    }
Begin:

    // End:0x81
    if(ShouldDelayPawnSpawningUntilMPReady())
    {
        bWaitingToStartMatch = true;
        J0x19:

        // End:0x33 [Loop If]
        if(!bGameReady)
        {
            Sleep(0.5000000);
            // [Loop Continue]
            goto J0x19;
        }
        J0x33:

        // End:0x63 [Loop If]
        if(SeekFreeMultiClassLoader.PendingClasses.Length > 0)
        {
            Sleep(0.1000000);
            // [Loop Continue]
            goto J0x33;
        }
        J0x63:

        // End:0x7E [Loop If]
        if((CheckIfEveryoneReady()) == false)
        {
            Sleep(0.1000000);
            // [Loop Continue]
            goto J0x63;
        }        
    }
    StartMatch();
    stop;            
}

defaultproperties
{
    EnemyProximityToSpawn=2000.0000000
    TeammateProximityToSpawn=3000.0000000
    MinimumProximityToSpawn=100.0000000
    SpawnRatingBucket_Excellent=20.0000000
    SpawnRatingBucket_Good=8.0000000
    SpawnRatingBucket_Acceptable=-10.0000000
    SpawnRatingBucket_Poor=-30.0000000
    SpawnRatingWeight_Excellent=15.0000000
    SpawnRatingWeight_Good=7.0000000
    SpawnRatingWeight_Acceptable=2.0000000
    SpawnRatingWeight_Poor=0.2000000
    SpawnRuleValue_TeammateProximity=10.0000000
    SpawnRuleValue_PrimarySpawn=10.0000000
    SpawnRuleValue_LargeTeammatePresence=10.0000000
    SpawnRuleValue_SpawnOwner=10.0000000
    SpawnRuleValue_LargeEnemyPresence=-10.0000000
    SpawnRuleValue_EnemyProximity=-10.0000000
    SpawnRuleValue_VisibleToEnemy=-10.0000000
    SpawnRuleValue_Telefrag=-100.0000000
    SpawnRuleValue_SpawnDisabled=-100.0000000
    TeamColor_1=(R=0,G=130,B=218,A=255)
    TeamColor_2=(R=218,G=72,B=0,A=255)
    TeamColor_3=(R=64,G=255,B=64,A=255)
    bIncapacitatePlayerOnDeath=true
    bScorePlayerKill=true
    bPlayerDeathAffectsScore=true
    bPlayerDeathAffectsTeamScore=true
    bAllowNegativePlayerScore=true
    TeamLives=(Attackers=-1,Defenders=-1)
    AttackingTeamIndex=-1
    TeamNameList=/* Array type was not detected. */
    MatchCompletionBonus=500
    RoundStartAnnouncementDelay=3.0000000
    UpdateGameSettingsTime=15
    NetFrequencyOverride=15
    // Reference: LPTrueSkillCalculator'Default__LPGameMP_Base.PlayerRankCalculator0'
    begin object name=PlayerRankCalculator0 class=Class'LPTrueSkillCalculator'
    end object
    PlayerRankCalculator=PlayerRankCalculator0
    NumTeams=2
    // Reference: SPAIVisibilityManager'Default__LPGameMP_Base.VisMan0'
    begin object name=VisMan0
    end object
    AIVisMan=VisMan0
    bUseSeamlessTravel=true
    DefaultPawnClass=Class'LPPawn'
    HUDType=Class'LPHUD'
    DeathMessageClass=Class'LPDeathMessage_MP'
    AccessControlClass=Class'LPAccessControl'
    BroadcastHandlerClass=Class'LPBroadcastHandler'
    AutoTestManagerClass=Class'LPAutoTestManager'
    PlayerControllerClass=Class'LPPlayerController'
    PlayerReplicationInfoClass=Class'LPPRI'
    GameReplicationInfoClass=Class'LPGRI_Base_MP'
    BusyIndicators[1]=(Material=Material'HUD.loadingRing',EdgeOffsetY=0.3000000)
    BusyIndicators[2]=(Material=Material'HUD.saveWheel',EdgeOffsetY=0.3000000)
}