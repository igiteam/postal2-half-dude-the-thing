class LPTuneDataScenarioGameSettings extends LPTuneDataOnlineGameSettings
    editinlinenew;

struct OnlineTeamRangeParameter
{
    var(0.25_Pct) /*0x9CB40000-0x00000000*/ private bool bPlayerOption[65537];
    var(0.25_Pct) /*0x9CB40000-0x00000000*/ private byte Min[65537];
    var(0.25_Pct) /*0x9CB40000-0x00000000*/ private byte Max[65537];
    var(0.25_Pct) /*0x9CB40000-0x00000000*/ private byte Current[65537];

    structdefaultproperties
    {
        bPlayerOption=false
        Min=ELPTeams.LPTeam_Nevec
        Max=ELPTeams.LPTeam_Nevec
        Current=ELPTeams.LPTeam_Nevec
    }
};

struct OnlineSpawnCountParameter
{
    var(0.25_Pct) /*0x9CA10000-0x00000000*/ private bool bPlayerOption[65537];
    var(0.25_Pct) /*0x9CA10000-0x00000000*/ private int Min[65537];
    var(0.25_Pct) /*0x9CA10000-0x00000000*/ private int Max[65537];
    var(0.25_Pct) /*0x9CA10000-0x00000000*/ private int Current[65537];
    var(0.25_Pct) /*0x9CA10000-0x00000000*/ private bool bInfinite[65537];

    structdefaultproperties
    {
        bPlayerOption=false
        Min=0
        Max=0
        Current=0
        bInfinite=false
    }
};

var(0.25_Pct) /*0xAF700000-0x00000000*/ private @NULL Attackers[65537];
var(0.25_Pct) /*0xAF700000-0x00000000*/ private @NULL AttackerSpawnCount[65537];
var(0.25_Pct) /*0xAF700000-0x00000000*/ private @NULL DefenderSpawnCount[65537];
var(0.25_Pct) /*0xAF700000-0x00000000*/ private bool bDualAttackers[65537];
var(0.25_Pct) /*0xAF700000-0x00000000*/ private byte WinCondition[65537];

defaultproperties
{
    Attackers=(bPlayerOption=true,Min=ELPTeams.LPTeam_Nevec,Max=ELPTeams.LPTeam_Pirates,Current=ELPTeams.LPTeam_Nevec)
    AttackerSpawnCount=(bPlayerOption=false,Min=10,Max=50,Current=25,bInfinite=false)
    DefenderSpawnCount=(bPlayerOption=false,Min=10,Max=50,Current=25,bInfinite=true)
    WinCondition=eEndGameWinCondition.eEndGameWinCondition_ObjectivesMet
    RoundsToWin=(Max=3)
    bTeamScoreAkridKill=false
    bScorePlayerKill=false
    bTeamScorePlayerKill=false
    bPlayerDeathAffectsScore=false
    bPlayerDeathAffectsTeamScore=false
    TimeLimit=(Min=15,Max=30,Current=15)
    GoalScore=(Min=0,Max=0,Increment=0,Current=0)
    PlayerCount=(bPlayerOption=false,Max=10,Current=10)
}