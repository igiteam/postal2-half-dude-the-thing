class LPGameMP_TDM extends LPGameMP_Base
    abstract
    config(Game)
    hidecategories(AnimDependency,Navigation,Movement,Collision);

static event SetGameType()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string MapName[8388609], Options, Portal;
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL DataStoreGameSettings, GameSettings, DataStoreManager;

    DataStoreManager = Class'Engine.UIInteraction'.static.GetDataStoreClient();
    // End:0x10C
    if(DataStoreManager != none)
    {
        DataStoreGameSettings = LPUIDataStore_OnlineGameSettings(Class'Engine.UIRoot'.static.StaticResolveDataStore(Class'LPUIDataStore_OnlineGameSettings'.default.Tag));
        GameSettings = LPOnlineGameSettings(DataStoreGameSettings.GetCurrentGameSettings());
        // End:0x10C
        if((LPTeamDeathmatchGameSettings(GameSettings) == none) && DataStoreGameSettings != none)
        {
            DataStoreGameSettings.SetCurrentByName('TeamDeathmatchLAN');
        }
    }
    return default.Class;
    //return ReturnValue;    
}

event Login()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string Portal[8388609], Options;
    local /*0x97E50000-0x00000000*/ private @NULL UniqueId[8519681];
    local /*0x97E50000-0x00000000*/ private editfixedsize string ErrorMessage[25165825];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], PC;
    local /*0x97E50000-0x00000000*/ private int NewTeam;

    PC = super.Login(Portal, Options, UniqueId, ErrorMessage);
    // End:0x96
    if(Class'LPGameViewportClient'.static.IsTGSDemo())
    {
        // End:0x96
        if(GetTGSOverrideTeam(PC, NewTeam))
        {
            ChangeTeam(PC, NewTeam, true);
        }
    }
    return PC;
    //return ReturnValue;    
}

function PickTeam()
{
    local /*0x97E50000-0x00000000*/ private byte Current[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL C[8388609];
    local /*0x97E50000-0x00000000*/ private byte ReturnValue[92274689], ret;
    local /*0x97E50000-0x00000000*/ private int I;
    local /*0x97E50000-0x00000000*/ private editfixedsize array TeamCountArray;
    local /*0x97E50000-0x00000000*/ private @NULL PRI;
    local /*0x97E50000-0x00000000*/ private int iLowestValue, iLowestIndex, NumTeamsToTest;

    ret = Current;
    NumTeamsToTest = WorldInfo.GRI.Teams.Length;
    // End:0x6D
    if(NumTeamsToTest > 2)
    {
        NumTeamsToTest = 2;
    }
    I = 0;
    J0x78:

    // End:0xB2 [Loop If]
    if(I < NumTeamsToTest)
    {
        TeamCountArray[I] = 0;
        ++I;
        // [Loop Continue]
        goto J0x78;
    }
    I = 0;
    J0xBD:

    // End:0x1F7 [Loop If]
    if(I < WorldInfo.GRI.PRIArray.Length)
    {
        PRI = LPPRI(WorldInfo.GRI.PRIArray[I]);
        // End:0x1E9
        if(((PRI != none) && PRI.PawnClass != none) && PRI.Team != none)
        {
            ++TeamCountArray[PRI.Team.TeamIndex];
        }
        ++I;
        // [Loop Continue]
        goto J0xBD;
    }
    iLowestIndex = 0;
    iLowestValue = 9999;
    I = 0;
    J0x21C:

    // End:0x293 [Loop If]
    if(I < TeamCountArray.Length)
    {
        // End:0x285
        if(TeamCountArray[I] < iLowestValue)
        {
            iLowestValue = TeamCountArray[I];
            iLowestIndex = I;
        }
        ++I;
        // [Loop Continue]
        goto J0x21C;
    }
    ret = byte(iLowestIndex);
    return ret;
    //return ReturnValue;    
}

function CheckScore()
{
    local /*0x97E50000-0x00000000*/ private @NULL Scorer[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private float Team1ScoreDiff, Team2ScoreDiff, GoalScoreFloat;
    local /*0x97E50000-0x00000000*/ private @NULL MIMP;

    // End:0x3A7
    if(Scorer.Team != none)
    {
        // End:0x8C
        if(Scorer.Team.Score >= float(GoalScore))
        {
            EndGame(Scorer, "teamscorelimit");
            return true;
        }
        MIMP = LPMapInfo_MP(WorldInfo.GetMapInfo());
        // End:0x3A7
        if(((MIMP != none) && WorldInfo.GRI.Teams.Length >= 2) && GoalScore > 0)
        {
            GoalScoreFloat = float(GoalScore);
            Team1ScoreDiff = WorldInfo.GRI.Teams[0].Score / GoalScoreFloat;
            Team2ScoreDiff = WorldInfo.GRI.Teams[1].Score / GoalScoreFloat;
            // End:0x2CB
            if(!bPlayedWinLoseAnnouncementTeam1)
            {
                // End:0x2CB
                if(Team1ScoreDiff > (MIMP.TuneDataMapInfo.MinScorePercentToPlayWinLoseEvents * 0.0100000))
                {
                    // End:0x2CB
                    if(((Team1ScoreDiff - Team2ScoreDiff) * 100.0000000) > float(MIMP.TuneDataMapInfo.ScoreDiffPercentToPlayWinLoseEvents))
                    {
                        bPlayedWinLoseAnnouncementTeam1 = true;
                        Class'LPTuneDataMapInfoMP'.static.BroadcastAnnouncement(5,, 0);
                    }
                }
            }
            // End:0x3A7
            if(!bPlayedWinLoseAnnouncementTeam2)
            {
                // End:0x3A7
                if(Team2ScoreDiff > (MIMP.TuneDataMapInfo.MinScorePercentToPlayWinLoseEvents * 0.0100000))
                {
                    // End:0x3A7
                    if(((Team2ScoreDiff - Team1ScoreDiff) * 100.0000000) > float(MIMP.TuneDataMapInfo.ScoreDiffPercentToPlayWinLoseEvents))
                    {
                        bPlayedWinLoseAnnouncementTeam2 = true;
                        Class'LPTuneDataMapInfoMP'.static.BroadcastAnnouncement(5,, 1);
                    }
                }
            }
        }
    }
    return super.CheckScore(Scorer);
    //return ReturnValue;    
}

function SetGameRules()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL MyGameSettings, TD;

    super.SetGameRules();
    MyGameSettings = LPTeamDeathmatchGameSettings(GetGameSettingsObject());
    // End:0x38
    if(MyGameSettings == none)
    {
        return false;
    }
    // End:0x5E
    if(MyGameSettings.TuneDataOnlineGameSettings == none)
    {
        return false;
    }
    TD = LPTuneDataTeamDeathmatchGameSettings(MyGameSettings.TuneDataOnlineGameSettings.FindParameterSet(name(WorldInfo.GetMapName()), true, MyGameSettings));
    // End:0xE3
    if(TD == none)
    {
        return false;
    }
    return true;
    //return ReturnValue;    
}

function ScoreKill()
{
    local /*0x97E50000-0x00000000*/ private @NULL Killer[8388609], Victim;

    // End:0x63
    if((LPAIController(Victim) != none) || LPBaseVSPlayerPawn(Victim.Pawn) != none)
    {
        super.ScoreKill(Killer, Victim);
    }
    //return;    
}

function ScoreIncapacitation()
{
    local /*0x97E50000-0x00000000*/ private @NULL Killer[8388609], Victim;

    ScoreKill(Killer, Victim);
    //return;    
}

function ScoreRevival()
{
    local /*0x97E50000-0x00000000*/ private @NULL Savior[8388609], Revived, RevivedPRI;

    RevivedPRI = LPPRI(Revived.PlayerReplicationInfo);
    // End:0x82
    if(bPlayerDeathAffectsScore)
    {
        RevivedPRI.Score += float(1);
        RevivedPRI.bForceNetUpdate = true;
    }
    // End:0xE8
    if(bPlayerDeathAffectsTeamScore)
    {
        RevivedPRI.Team.Score += float(1);
        RevivedPRI.bForceNetUpdate = true;
    }
    // End:0x1BF
    if(bTeamScorePlayerKill)
    {
        // End:0x1BF
        if(int(RevivedPRI.LastKillerPRI.GetTeamNum()) != int(RevivedPRI.GetTeamNum()))
        {
            RevivedPRI.LastKillerPRI.Team.Score -= float(1);
            RevivedPRI.bForceNetUpdate = true;
        }
    }
    //return;    
}

defaultproperties
{
    bTeamScorePlayerKill=true
    bPlayerDeathAffectsScore=false
    bPlayerDeathAffectsTeamScore=false
    bIsRanked=true
    // Reference: LPTrueSkillCalculator'Default__LPGameMP_TDM.PlayerRankCalculator0'
    begin object name=PlayerRankCalculator0
    end object
    PlayerRankCalculator=PlayerRankCalculator0
    PlayerRankCalculatorClass=Class'LPTrueSkillCalculatorTDM'
    // Reference: SPAIVisibilityManager'Default__LPGameMP_TDM.VisMan0'
    begin object name=VisMan0
    end object
    AIVisMan=VisMan0
    GoalScore=30
    TimeLimit=12
    GameReplicationInfoClass=Class'LPGRI_TDM_MP'
}