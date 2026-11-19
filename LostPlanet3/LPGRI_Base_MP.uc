class LPGRI_Base_MP extends LPGRI
    abstract
    config(Game)
    hidecategories(AnimDependency,Navigation,Movement,Collision);

const MAX_ROUNDS = 5;

enum eEndGameReason
{
    eEndGameReason_NoReason,        // 0
    eEndGameReason_ObjectivesMet,   // 1
    eEndGameReason_ObjectivesNotMet,// 2
    eEndGameReason_AllDead,         // 3
    eEndGameReason_ScoreMet,        // 4
    eEndGameReason_TimerEnded,      // 5
    eEndGameReason_GameComplete,    // 6
    eEndGameReason_MAX              // 7
};

enum eEndGameWinCondition
{
    eEndGameWinCondition_Default,   // 0
    eEndGameWinCondition_TeamScore, // 1
    eEndGameWinCondition_PlayerScore,// 2
    eEndGameWinCondition_PlayerKills,// 3
    eEndGameWinCondition_PlayerDeaths,// 4
    eEndGameWinCondition_ObjectivesMet,// 5
    eEndGameWinCondition_TeamLives, // 6
    eEndGameWinCondition_TeamCredits,// 7
    eEndGameWinCondition_MAX        // 8
};

enum EGameStatus
{
    GS_None,                        // 0
    GS_WaitingForHost,              // 1
    GS_PreMatch,                    // 2
    GS_RoundInProgress,             // 3
    GS_RoundOver,                   // 4
    GS_EndMatch,                    // 5
    GS_Loading,                     // 6
    GS_MAX                          // 7
};

struct native EndOfGameCondition
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte Reason;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte WinCondition;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private int RepCounter;

    structdefaultproperties
    {
        Reason=eEndGameReason.eEndGameReason_NoReason
        WinCondition=eEndGameWinCondition.eEndGameWinCondition_Default
        RepCounter=0
    }
};

var(0.25_Pct) /*0x97E50000-0x00000000*/ private travel LPGRI_Base_MP.EGameStatus GameStatus[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte GameType;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private EndOfGameCondition GameEndCondition[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bAutoRespawnOnDeath[1075838977];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bWaveRespawnOnDeath[1075838977];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bExitSpectatorModeWithInput[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bDisableTapout[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bObjectiveActive[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bIsQuickMatch[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MPMinRespawnDelay1[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MPRespawnDelay1[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MPMinRespawnDelay2[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MPRespawnDelay2[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MPScoreboardDelay[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private travel int TimeAdded[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int CurrentRound[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int RoundsToWin[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int RoundsWonTeam1[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int RoundsWonTeam2[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int Team1Index[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int WinningTeamByRound[2097157];
var(0.25_Pct_58261503) /*0x97E50000-0x00000000*/ private int ObjectivesCompleted[2097156];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize ActiveObjectiveMessageInfo ActiveMPObjective[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int TimeToDelayGameStart[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private travel int SecondsUntilGameStarts[2097153];

simulated event PostBeginPlay()
{
    super(GameReplicationInfo).PostBeginPlay();
    // End:0x62
    if(Class'LPMultiplayerManager'.static.GetInstance().bAllowHostMigration)
    {
        WorldInfo.ToggleHostMigration(true);
    }
    //return;    
}

function SetGameStatus()
{
    local /*0x97E50000-0x00000000*/ private byte NewGameStatus[8388609];

    GameStatus = NewGameStatus;
    switch(GameStatus)
    {
        // End:0x2E
        case 1:
            // End:0x51
            break;
        // End:0x36
        case 2:
            // End:0x51
            break;
        // End:0x3E
        case 4:
            // End:0x51
            break;
        // End:0x46
        case 3:
            // End:0x51
            break;
        // End:0x4E
        case 5:
            // End:0x51
            break;
        // End:0xFFFF
        default:
            break;
    }
    //return;    
}

simulated event ReplicatedEvent()
{
    local /*0x97E50000-0x00000000*/ private name VarName[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL LPPC;

    // End:0x24
    if(VarName == 'TimeAdded')
    {
        HandleTimeAdded();        
    }
    else
    {
        // End:0x99
        if(VarName == 'SecondsUntilGameStarts')
        {
            // End:0x98
            foreach WorldInfo.LocalPlayerControllers(Class'LPPlayerController', LPPC)
            {
                LPPC.onNotifySecondsUntilGameStarts(SecondsUntilGameStarts);                
            }            
        }
    }
    super.ReplicatedEvent(VarName);
    //return;    
}

simulated function HandleTimeAdded()
{
    local /*0x97E50000-0x00000000*/ private @NULL MIMP;

    WorldInfo.Game.UpdateGameSettings();
    MIMP = LPMapInfo_MP(WorldInfo.GetMapInfo());
    // End:0x110
    if((MIMP != none) && MIMP.TimerEvents != none)
    {
        MIMP.TimerEvents.BuildSortedEventList();
        MIMP.TimerEvents.DoTriggerCheck(float(ElapsedTime), false);
    }
    //return;    
}

simulated event Timer()
{
    UpdateElapsedTime();
    super(GameReplicationInfo).Timer();
    //return;    
}

simulated function UpdateElapsedTime()
{
    local /*0x97E50000-0x00000000*/ private int VerifiedElapsedTime;

    VerifiedElapsedTime = ((TimeLimit * 60) + TimeAdded) - RemainingTime;
    // End:0x57
    if(ElapsedTime != VerifiedElapsedTime)
    {
        ElapsedTime = VerifiedElapsedTime;
    }
    //return;    
}

simulated function GetRespawnDelay()
{
    local /*0x97E50000-0x00000000*/ private int TeamNum[8388609], ReturnValue, TimeUntilRespawn;
    local /*0x97E50000-0x00000000*/ private float RespawnDelay, MinRespawnDelay;

    // End:0x38
    if(TeamNum == 0)
    {
        RespawnDelay = MPRespawnDelay1;
        MinRespawnDelay = MPMinRespawnDelay1;        
    }
    else
    {
        RespawnDelay = MPRespawnDelay2;
        MinRespawnDelay = MPMinRespawnDelay2;
    }
    // End:0x88
    if(RespawnDelay < MinRespawnDelay)
    {
        RespawnDelay = MinRespawnDelay;
    }
    // End:0x127
    if(bWaveRespawnOnDeath)
    {
        TimeUntilRespawn = int(RespawnDelay) - (WorldInfo.GRI.ElapsedTime % int(RespawnDelay));
        // End:0x11A
        if(float(TimeUntilRespawn) < MinRespawnDelay)
        {
            TimeUntilRespawn = int(RespawnDelay);
        }
        return TimeUntilRespawn;        
    }
    else
    {
        return int(RespawnDelay);
    }
    //return ReturnValue;    
}

function EndRound()
{
    local /*0x97E50000-0x00000000*/ private byte Reason[8388609], WinCondition;

    GameEndCondition.Reason = Reason;
    // End:0x76
    if(int(WinCondition) == int(0))
    {
        GameEndCondition.WinCondition = default.GameEndCondition.WinCondition;        
    }
    else
    {
        GameEndCondition.WinCondition = WinCondition;
    }
    GameEndCondition.RepCounter++;
    // End:0x127
    if(LPGameMP_Base(WorldInfo.Game) != none)
    {
        LPGameMP_Base(WorldInfo.Game).EndGame(none, "");
    }
    //return;    
}

simulated function FindPawnFromPRIID()
{
    local /*0x97E50000-0x00000000*/ private int iPlayerID[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], LPP;

    // End:0xA9
    foreach WorldInfo.AllPawns(Class'LPPlayerPawn', LPP)
    {
        // End:0xA8
        if((LPP.PlayerReplicationInfo != none) && LPP.PlayerReplicationInfo.PlayerID == iPlayerID)
        {            
            return LPP;
        }        
    }    
    return none;
    //return ReturnValue;    
}

simulated function FindPawnFromPRI()
{
    local /*0x97E50000-0x00000000*/ private @NULL PRI[8388609], ReturnValue, LPP;

    // End:0x6E
    foreach WorldInfo.AllPawns(Class'LPPlayerPawn', LPP)
    {
        // End:0x6D
        if(LPP.PlayerReplicationInfo == PRI)
        {            
            return LPP;
        }        
    }    
    return none;
    //return ReturnValue;    
}

simulated function FindFirstTeamMember()
{
    local /*0x97E50000-0x00000000*/ private int iTeamIndex[8388609];
    local /*0x97E50000-0x00000000*/ private bool bAlive[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], LPP;

    true
    // End:0xB8
    foreach WorldInfo.AllPawns(Class'LPPlayerPawn', LPP)
    {
        // End:0xB7
        if((bAlive && LPP.IsAlive()) || !bAlive)
        {
            // End:0xB7
            if(int(LPP.GetTeamNum()) == iTeamIndex)
            {                
                return LPP;
            }
        }        
    }    
    return none;
    //return ReturnValue;    
}

simulated function FindNextTeamMember()
{
    local /*0x97E50000-0x00000000*/ private @NULL inLPP[8388609];
    local /*0x97E50000-0x00000000*/ private int iTeamIndex[8388609];
    local /*0x97E50000-0x00000000*/ private bool bAlive[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], LPP;
    local /*0x97E50000-0x00000000*/ private bool bFoundMe;
    local /*0x97E50000-0x00000000*/ private @NULL FirstLPP;
    local /*0x97E50000-0x00000000*/ private int T1, t2;

    true
    T1 = iTeamIndex;
    // End:0x19C
    foreach WorldInfo.AllPawns(Class'LPPlayerPawn', LPP)
    {
        // End:0x75
        if(LPP == inLPP)
        {
            bFoundMe = true;
            continue;            
        }
        t2 = int(LPP.GetTeamNum());
        // End:0x19B
        if((T1 == 255) || T1 == t2)
        {
            // End:0x141
            if(!bFoundMe && FirstLPP == none)
            {
                // End:0x13E
                if((bAlive && LPP.IsAlive()) || !bAlive)
                {
                    FirstLPP = LPP;
                }
                // End:0x19B
                continue;
            }
            // End:0x19B
            if(bFoundMe)
            {
                // End:0x19B
                if((bAlive && LPP.IsAlive()) || !bAlive)
                {                    
                    return LPP;
                }
            }
        }        
    }    
    // End:0x1B6
    if(FirstLPP == none)
    {
        return inLPP;
    }
    return FirstLPP;
    //return ReturnValue;    
}

simulated function FindPrevTeamMember()
{
    local /*0x97E50000-0x00000000*/ private @NULL inLPP[8388609];
    local /*0x97E50000-0x00000000*/ private int iTeamIndex[8388609];
    local /*0x97E50000-0x00000000*/ private bool bAlive[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], LPP, LastLPP;
    local /*0x97E50000-0x00000000*/ private int T1, t2;

    true
    T1 = iTeamIndex;
    // End:0x131
    foreach WorldInfo.AllPawns(Class'LPPlayerPawn', LPP)
    {
        // End:0x83
        if(LPP == inLPP)
        {
            // End:0x7F
            if(LastLPP != none)
            {                
                return LastLPP;
            }
            continue;            
        }
        t2 = int(LPP.GetTeamNum());
        // End:0x130
        if((T1 == 255) || T1 == t2)
        {
            // End:0x130
            if((bAlive && LPP.IsAlive()) || !bAlive)
            {
                LastLPP = LPP;
                continue;                
            }
        }        
    }    
    // End:0x14B
    if(LastLPP == none)
    {
        return inLPP;
    }
    return LastLPP;
    //return ReturnValue;    
}

static function LogActiveObjectiveInfo()
{
    local /*0x97E50000-0x00000000*/ private @NULL GRI;

    GRI = LPGRI_Base_MP(Class'Engine.WorldInfo'.static.GetWorldInfo().GRI);
    // End:0x5A
    if(GRI != none)
    {        
    }
    //return;    
}

static function ConstructActiveObjectiveMessage()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL MessageInfo[25165825];
    local /*0x97E50000-0x00000000*/ private int ListeningTeamNum[8388609];
    local /*0x97E50000-0x00000000*/ private float DisplayTime[9437185];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL GRI;

    -1.0000000
    GRI = LPGRI_Base_MP(Class'Engine.WorldInfo'.static.GetWorldInfo().GRI);
    // End:0x19E
    if(GRI != none)
    {
        // End:0x19E
        if(GRI.bObjectiveActive)
        {
            return ConstructObjectiveMessageInfo(GRI.ActiveMPObjective.EventName, GRI.ActiveMPObjective.ObjectiveName, GRI.ActiveMPObjective.ObjectiveType, true, GRI.ActiveMPObjective.InstigatorName, GRI.ActiveMPObjective.InstigatorTeamNum, DisplayTime, ListeningTeamNum, MessageInfo);
        }
    }
    return false;
    //return ReturnValue;    
}

static function ConstructObjectiveMessageInfo()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string EventName[142606337], ObjectiveName;
    local /*0x97E50000-0x00000000*/ private int ObjectiveType[8388609];
    local /*0x97E50000-0x00000000*/ private bool bPrimary[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize string InstigatorName[142606337];
    local /*0x97E50000-0x00000000*/ private int InstigatorTeamNum[8388609];
    local /*0x97E50000-0x00000000*/ private float fDisplayTime[8388609];
    local /*0x97E50000-0x00000000*/ private int ListeningTeamNum[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL MessageInfo[25165825];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private editfixedsize string MessageBody, MessageTitle;
    local /*0x97E50000-0x00000000*/ private @NULL DRO, LPMI;

    // End:0x202
    if(ConstructObjectiveMessage(EventName, ObjectiveName, ObjectiveType, InstigatorName, InstigatorTeamNum, ListeningTeamNum, MessageTitle, MessageBody))
    {
        MessageInfo.MessageTitle = MessageTitle;
        MessageInfo.MessageBody = MessageBody;
        MessageInfo.ObjectiveType = ObjectiveType;
        MessageInfo.DisplayTime = fDisplayTime;
        MessageInfo.bPrimary = bPrimary;
        // End:0x200
        if(MessageInfo.ObjectiveType == 5)
        {
            LPMI = LPMapInfo(Class'Engine.WorldInfo'.static.GetWorldInfo().GetMapInfo());
            // End:0x1FF
            foreach LPMI.DisableRepairItemList(DRO)
            {
                // End:0x1FB
                if(int(DRO.OwningTeam) != ListeningTeamNum)
                {
                    MessageInfo.ObjectiveType = 2;
                }
                goto J0x1FF;                
            }
            J0x1FF:
            
        }
        return true;
    }
    return false;
    //return ReturnValue;    
}

static function GetAttackingTeamNum()
{
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL GRI, TI;

    GRI = LPGRI_Base_MP(Class'Engine.WorldInfo'.static.GetWorldInfo().GRI);
    // End:0xDC
    if(GRI.Teams.Length > 0)
    {
        TI = LPTeamInfo_MP(GRI.Teams[0]);
        return ((TI == none) ? 0 : ((TI.bAttackingTeam) ? 0 : 1));        
    }
    else
    {
        return 0;
    }
    //return ReturnValue;    
}

static function ConstructObjectiveMessage()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string EventName[142606337], ObjectiveName;
    local /*0x97E50000-0x00000000*/ private int ObjectiveType[25165825];
    local /*0x97E50000-0x00000000*/ private editfixedsize string InstigatorName[142606337];
    local /*0x97E50000-0x00000000*/ private int InstigatorTeamNum[8388609], ListeningTeamNum;
    local /*0x97E50000-0x00000000*/ private editfixedsize string LocalizedTitle[25165825], LocalizedBody;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private int AttackingTeamIndex;
    local /*0x97E50000-0x00000000*/ private editfixedsize string MessageBodyPrefix, MessageBodyPostfix;

    AttackingTeamIndex = GetAttackingTeamNum();
    MessageBodyPrefix = "LostPlanetGame.MPObjectives";
    // End:0xA2
    if(LPGRI_Survival_MP(Class'Engine.WorldInfo'.static.GetWorldInfo().GRI) != none)
    {
        MessageBodyPrefix = MessageBodyPrefix $ "_Survival";        
    }
    else
    {
        MessageBodyPrefix = MessageBodyPrefix $ ((ListeningTeamNum == AttackingTeamIndex) ? "_Attack" : "_Defend");
    }
    switch(byte(ObjectiveType))
    {
        // End:0x16C
        case 1:
            LocalizedTitle = Class'LPHUDTeamScores'.static.TranslateString("Extraction");
            LocalizedBody = Class'LPHUDTeamScores'.static.TranslateString("ExtractionDesc");
            return true;
        // End:0x1F9
        case 2:
            LocalizedTitle = Class'LPHUDTeamScores'.static.TranslateString("TDM");
            LocalizedBody = Class'LPHUDTeamScores'.static.TranslateString(((ListeningTeamNum == 0) ? "TDMDescNEVEC" : "TDMDescPirates"));
            return true;
        // End:0x295
        case 9:
            LocalizedTitle = Class'LPHUDTeamScores'.static.TranslateString("Survival");
            LocalizedBody = Class'LPHUDTeamScores'.static.TranslateString(((ListeningTeamNum == 0) ? "SurvivalDescNEVEC" : "SurvivalDescPirates"));
            return true;
        // End:0x2B4
        case 3:
            MessageBodyPostfix = "_PlantBomb.";
            // End:0x34B
            break;
        // End:0x2CD
        case 4:
            MessageBodyPostfix = "_CTF.";
            // End:0x34B
            break;
        // End:0x2F0
        case 5:
            MessageBodyPostfix = "_DisableRepair.";
            // End:0x34B
            break;
        // End:0x312
        case 6:
            MessageBodyPostfix = "_SeizeControl.";
            // End:0x34B
            break;
        // End:0x32E
        case 7:
            MessageBodyPostfix = "_Escort.";
            // End:0x34B
            break;
        // End:0x348
        case 8:
            MessageBodyPostfix = "_Kill.";
            // End:0x34B
            break;
        // End:0xFFFF
        default:
            break;
    }
    MessageBodyPostfix = (MessageBodyPostfix $ "Event") $ EventName;
    return ConstructHUDMessage(AttackingTeamIndex, MessageBodyPrefix, MessageBodyPostfix, ObjectiveName, InstigatorName, InstigatorTeamNum, LocalizedTitle, LocalizedBody);
    //return ReturnValue;    
}

static function ConstructHUDMessage()
{
    local /*0x97E50000-0x00000000*/ private int AttackingTeamIndex[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize string MessageBodyPrefix[142606337], MessageBodyPostfix, ObjectiveName, InstigatorName;
    local /*0x97E50000-0x00000000*/ private int InstigatorTeamIndex[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize string LocalizedTitle[25165825], LocalizedBody;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private editfixedsize string AttackerName, DefenderName, InstigatorTeamName;
    local /*0x97E50000-0x00000000*/ private @NULL TransContext, TransTag, LP;
    local /*0x97E50000-0x00000000*/ private editfixedsize string MapName;
    local /*0x97E50000-0x00000000*/ private int DefendingTeamIndex;
    local /*0x97E50000-0x00000000*/ private editfixedsize string LocalizedObjectiveName;
    local /*0x97E50000-0x00000000*/ private @NULL WI;

    // End:0x13
    if(Len(MessageBodyPrefix) <= 0)
    {
        return false;
    }
    LP = Class'Engine.UIInteraction'.static.GetLocalPlayer(0);
    TransContext = LP.GetTranslationContext();
    TransTag = TransContext.GetTranslatorTagFromName('Strings');
    WI = Class'Engine.WorldInfo'.static.GetWorldInfo();
    MapName = WI.GetMapName();
    DefendingTeamIndex = ((AttackingTeamIndex == 0) ? 1 : 0);
    AttackerName = Class'LPGameMP_Base'.static.GetTeamName(AttackingTeamIndex);
    DefenderName = Class'LPGameMP_Base'.static.GetTeamName(DefendingTeamIndex);
    InstigatorTeamName = Class'LPGameMP_Base'.static.GetTeamName(InstigatorTeamIndex);
    LogActiveObjectiveInfo();
    // End:0x2BD
    if(InStr(MessageBodyPrefix, "<Strings:") == 0)
    {
        // End:0x235
        if(Len(MessageBodyPrefix) > 10)
        {
            LocalizedBody = Mid(MessageBodyPrefix, 9, Len(MessageBodyPrefix) - 10);
            LocalizedBody = TransTag.Translate(LocalizedBody);            
        }
        else
        {
            LocalizedBody = "";
        }
        // End:0x2AE
        if(Len(MessageBodyPostfix) > 10)
        {
            LocalizedTitle = Mid(MessageBodyPostfix, 9, Len(MessageBodyPostfix) - 10);
            LocalizedTitle = TransTag.Translate(LocalizedTitle);            
        }
        else
        {
            LocalizedTitle = "";
        }        
    }
    else
    {
        LocalizedBody = TransTag.Translate(((MessageBodyPrefix $ "_") $ MapName) $ MessageBodyPostfix);
        // End:0x62E
        if(Class'SPGfx.SPGFxUIView'.static.IsLocalizationSuccessful(LocalizedBody) && Len(LocalizedBody) > 0)
        {
            // End:0x5D4
            if(InStr(LocalizedBody, "<InstigatorConditional>") >= 0)
            {
                // End:0x449
                if(InstigatorTeamIndex == AttackingTeamIndex)
                {
                    LocalizedBody = TransTag.Translate((((MessageBodyPrefix $ "_") $ MapName) $ MessageBodyPostfix) $ "_Attacker");
                    LocalizedTitle = TransTag.Translate((((MessageBodyPrefix $ "_") $ MapName) $ MessageBodyPostfix) $ "_Attacker_Title");                    
                }
                else
                {
                    // End:0x51D
                    if(InstigatorTeamIndex == DefendingTeamIndex)
                    {
                        LocalizedBody = TransTag.Translate((((MessageBodyPrefix $ "_") $ MapName) $ MessageBodyPostfix) $ "_Defender");
                        LocalizedTitle = TransTag.Translate((((MessageBodyPrefix $ "_") $ MapName) $ MessageBodyPostfix) $ "_Defender_Title");                        
                    }
                    else
                    {
                        LocalizedBody = TransTag.Translate((((MessageBodyPrefix $ "_") $ MapName) $ MessageBodyPostfix) $ "_Akrid");
                        LocalizedTitle = TransTag.Translate((((MessageBodyPrefix $ "_") $ MapName) $ MessageBodyPostfix) $ "_Akrid_Title");
                    }
                }                
            }
            else
            {
                LocalizedTitle = TransTag.Translate((((MessageBodyPrefix $ "_") $ MapName) $ MessageBodyPostfix) $ "_Title");
            }            
        }
        else
        {
            LocalizedBody = TransTag.Translate(MessageBodyPrefix $ MessageBodyPostfix);
            // End:0x91F
            if(Class'SPGfx.SPGFxUIView'.static.IsLocalizationSuccessful(LocalizedBody) && Len(LocalizedBody) > 0)
            {
                // End:0x8D5
                if(InStr(LocalizedBody, "<InstigatorConditional>") >= 0)
                {
                    // End:0x78A
                    if(InstigatorTeamIndex == AttackingTeamIndex)
                    {
                        LocalizedBody = TransTag.Translate((MessageBodyPrefix $ MessageBodyPostfix) $ "_Attacker");
                        LocalizedTitle = TransTag.Translate((MessageBodyPrefix $ MessageBodyPostfix) $ "_Attacker_Title");                        
                    }
                    else
                    {
                        // End:0x83E
                        if(InstigatorTeamIndex == DefendingTeamIndex)
                        {
                            LocalizedBody = TransTag.Translate((MessageBodyPrefix $ MessageBodyPostfix) $ "_Defender");
                            LocalizedTitle = TransTag.Translate((MessageBodyPrefix $ MessageBodyPostfix) $ "_Defender_Title");                            
                        }
                        else
                        {
                            LocalizedBody = TransTag.Translate((MessageBodyPrefix $ MessageBodyPostfix) $ "_Akrid");
                            LocalizedTitle = TransTag.Translate((MessageBodyPrefix $ MessageBodyPostfix) $ "_Akrid_Title");
                        }
                    }                    
                }
                else
                {
                    LocalizedTitle = TransTag.Translate((MessageBodyPrefix $ MessageBodyPostfix) $ "_Title");
                }                
            }
            else
            {
                return false;
            }
        }
    }
    // End:0x95E
    if(Len(AttackerName) > 0)
    {
        LocalizedBody = Repl(LocalizedBody, "<Attackers>", AttackerName);
    }
    // End:0x99B
    if(Len(DefenderName) > 0)
    {
        LocalizedBody = Repl(LocalizedBody, "<Defenders>", DefenderName);
    }
    // End:0xA70
    if(Len(ObjectiveName) > 0)
    {
        // End:0xA44
        if(InStr(ObjectiveName, "<Strings:") == 0)
        {
            // End:0xA38
            if(Len(ObjectiveName) > 10)
            {
                LocalizedObjectiveName = Mid(ObjectiveName, 9, Len(ObjectiveName) - 10);
                LocalizedObjectiveName = TransTag.Translate(LocalizedObjectiveName);                
            }
            else
            {
                LocalizedObjectiveName = "";
            }
        }
        LocalizedBody = Repl(LocalizedBody, "<Objective>", LocalizedObjectiveName);
    }
    // End:0xAAE
    if(Len(InstigatorName) > 0)
    {
        LocalizedBody = Repl(LocalizedBody, "<Instigator>", InstigatorName);
    }
    // End:0xAF0
    if(Len(InstigatorTeamName) > 0)
    {
        LocalizedBody = Repl(LocalizedBody, "<InstigatorTeam>", InstigatorTeamName);
    }
    return true;
    //return ReturnValue;    
}

function IsMatchComplete()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x63
    if((RoundsToWin > 0) && ((RoundsWonTeam1 >= RoundsToWin) || RoundsWonTeam2 >= RoundsToWin) || CurrentRound >= ((RoundsToWin * 2) - 1))
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

function StartGameStartCountdown()
{
    SecondsUntilGameStarts = TimeToDelayGameStart;
    //return;    
}

static function IsPrivateSession()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL GRI;

    GRI = LPGRI_Base_MP(Class'Engine.WorldInfo'.static.GetWorldInfo().GRI);
    // End:0x79
    if(GRI != none)
    {
        return !GRI.bIsQuickMatch;
    }
    return false;
    //return ReturnValue;    
}

defaultproperties
{
    GameEndCondition=(Reason=eEndGameReason.eEndGameReason_NoReason,WinCondition=eEndGameWinCondition.eEndGameWinCondition_PlayerScore,RepCounter=0)
    bAutoRespawnOnDeath=true
    bWaveRespawnOnDeath=true
    MPMinRespawnDelay1=5.0000000
    MPRespawnDelay1=6.0000000
    MPMinRespawnDelay2=5.0000000
    MPRespawnDelay2=6.0000000
    MPScoreboardDelay=1.0000000
    TimeToDelayGameStart=6
    SecondsUntilGameStarts=-1
    bShouldReplicateRemainingSeconds=true
}