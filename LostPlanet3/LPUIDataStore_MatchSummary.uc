class LPUIDataStore_MatchSummary extends UIDataStore_StringBase
    transient
    config(Engine)
    hidecategories(Object,UIRoot);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bMatchDataNeedsShowing;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bMatchDataAvailable;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bMatchWonByNevec;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int MatchTimeInSeconds;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int MatchRounds;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int MatchRoundsWon;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int MatchRoundsLost;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array MatchWinsByRound;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int MatchTotalCredits;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int MatchBonusCredits;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array MatchScores;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array MatchAwards;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte MatchGameType;

function ResetMatch()
{
    local /*0x97E50000-0x00000000*/ private bool bResetRounds[9437185];

    true
    bMatchWonByNevec = false;
    bMatchDataAvailable = false;
    bMatchDataNeedsShowing = false;
    MatchGameType = 0;
    MatchTimeInSeconds = 0;
    // End:0x7A
    if(bResetRounds)
    {
        MatchRounds = 0;
        MatchRoundsWon = 0;
        MatchRoundsLost = 0;
        MatchWinsByRound.Length = 0;
    }
    MatchScores.Length = 0;
    MatchAwards.Length = 0;
    //return;    
}

function CreateScoreEntry()
{
    local /*0x97E50000-0x00000000*/ private @NULL PlayerID[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize string PlayerTag[8388609];
    local /*0x97E50000-0x00000000*/ private int PlayerRank[8388609], TeamNum, Kills, Deaths, Assists, Revives,
	    Credits;

    local /*0x97E50000-0x00000000*/ private bool bLocalPlayer[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL ReturnValue[92274689], Score;

    Score.PlayerTag = PlayerTag;
    Score.PlayerRank = PlayerRank;
    Score.PlayerID = PlayerID;
    Score.TeamNum = TeamNum;
    Score.Kills = Kills;
    Score.Deaths = Deaths;
    Score.Assists = Assists;
    Score.Revives = Revives;
    Score.Credits = Credits;
    Score.bLocalPlayer = bLocalPlayer;
    return Score;
    //return ReturnValue;    
}

function AddScoreEntry()
{
    local /*0x97E50000-0x00000000*/ private @NULL PlayerID[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize string PlayerTag[8388609];
    local /*0x97E50000-0x00000000*/ private int PlayerRank[8388609], TeamNum, Kills, Deaths, Assists, Revives,
	    Credits;

    local /*0x97E50000-0x00000000*/ private bool bLocalPlayer[8388609];

    AddScoreStruct(CreateScoreEntry(PlayerID, PlayerTag, PlayerRank, TeamNum, Kills, Deaths, Assists, Revives, Credits, bLocalPlayer));
    //return;    
}

function AddScoreStruct()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL Score[8388609];
    local /*0x97E50000-0x00000000*/ private int Idx;

    Idx = 0;
    J0x0B:

    // End:0x131 [Loop If]
    if(Idx < MatchScores.Length)
    {
        // End:0x123
        if((EqualEqual_UniqueNetIdUniqueNetId(MatchScores[Idx].PlayerID, Score.PlayerID) && MatchScores[Idx].PlayerTag == Score.PlayerTag) && MatchScores[Idx].TeamNum == Score.TeamNum)
        {
            MatchScores[Idx] = Score;
            return;
        }
        Idx++;
        // [Loop Continue]
        goto J0x0B;
    }
    MatchScores.AddItem(Score);    
    //return;    
}

function GetTeamTotals()
{
    local /*0x97E50000-0x00000000*/ private int TeamNum[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL ReturnValue[92274689], Score;
    local /*0x97E50000-0x00000000*/ private int Idx;

    Score.TeamNum = TeamNum;
    Score.Kills = 0;
    Score.Deaths = 0;
    Score.Assists = 0;
    Score.Revives = 0;
    Score.Credits = 0;
    Idx = 0;
    J0xC7:

    // End:0x275 [Loop If]
    if(Idx < MatchScores.Length)
    {
        // End:0x267
        if(MatchScores[Idx].TeamNum == TeamNum)
        {
            Score.Kills += MatchScores[Idx].Kills;
            Score.Deaths += MatchScores[Idx].Deaths;
            Score.Assists += MatchScores[Idx].Assists;
            Score.Revives += MatchScores[Idx].Revives;
            Score.Credits += MatchScores[Idx].Credits;
        }
        Idx++;
        // [Loop Continue]
        goto J0xC7;
    }
    return Score;
    //return ReturnValue;    
}

function AddAward()
{
    local /*0x97E50000-0x00000000*/ private name AwardName[8388609];
    local /*0x97E50000-0x00000000*/ private int TimesAwarded[8388609], CreditsAwarded;
    local /*0x97E50000-0x00000000*/ private @NULL MAS;
    local /*0x97E50000-0x00000000*/ private int Idx;

    Idx = 0;
    J0x0B:

    // End:0xC9 [Loop If]
    if(Idx < MatchAwards.Length)
    {
        // End:0xBB
        if(MatchAwards[Idx].AwardName == AwardName)
        {
            MatchAwards[Idx].AwardedNum += TimesAwarded;
            MatchAwards[Idx].AwardedCredits += CreditsAwarded;
            return;
        }
        Idx++;
        // [Loop Continue]
        goto J0x0B;
    }
    MAS.AwardName = AwardName;
    MAS.AwardedCredits = CreditsAwarded;
    MAS.AwardedNum = TimesAwarded;
    MatchAwards.AddItem(MAS);    
    //return;    
}

function GetCreditsAwarded()
{
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689], AwardedCredits, Idx;

    return MatchTotalCredits;
    AwardedCredits = 0;
    Idx = 0;
    J0x20:

    // End:0x77 [Loop If]
    if(Idx < MatchAwards.Length)
    {
        AwardedCredits += MatchAwards[Idx].AwardedCredits;
        Idx++;
        // [Loop Continue]
        goto J0x20;
    }
    AwardedCredits += MatchBonusCredits;
    return AwardedCredits;
    //return ReturnValue;    
}

static function GetMatchSummaryData()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], DataStoreMatchSummary, DataStoreManager;

    DataStoreManager = Class'Engine.UIInteraction'.static.GetDataStoreClient();
    // End:0x89
    if(DataStoreManager != none)
    {
        DataStoreMatchSummary = LPUIDataStore_MatchSummary(Class'Engine.UIRoot'.static.StaticResolveDataStore(Class'LPUIDataStore_MatchSummary'.default.Tag));
    }
    return DataStoreMatchSummary;
    //return ReturnValue;    
}

static function ResetMatchSummaryData()
{
    local /*0x97E50000-0x00000000*/ private @NULL DataStoreMatchSummary;

    DataStoreMatchSummary = GetMatchSummaryData();
    // End:0x43
    if(DataStoreMatchSummary != none)
    {
        DataStoreMatchSummary.ResetMatch(true);
    }
    //return;    
}

defaultproperties
{
    Tag="DataStoreMatchSummary"
}