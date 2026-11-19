class LPHostMigrationGameData extends SPHostMigrationGameData;

const MAX_ROUNDS = 5;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte GameStatus;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL GameEndCondition;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int CurrentRound;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int RoundsToWin;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int RoundsWonTeam1;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int RoundsWonTeam2;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int Team1Index;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int WinningTeamByRound[5];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bObjectiveActive;
var(0.25_Pct_58261503) /*0x97E50000-0x00000000*/ private int ObjectivesCompleted[4];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize @NULL ActiveMPObjective;

function ResetForNewMatch()
{
    super.ResetForNewMatch();
    //return;    
}

function ReadFromGRI()
{
    local /*0x97E50000-0x00000000*/ private @NULL GRI[8388609];
    local /*0x97E50000-0x00000000*/ private int Index;
    local /*0x97E50000-0x00000000*/ private @NULL LPGRI;

    LPGRI = LPGRI_Base_MP(GRI);
    // End:0x2D
    if(LPGRI == none)
    {
        return;
    }
    super.ReadFromGRI(GRI);
    GameStatus = LPGRI.GameStatus;
    GameEndCondition = LPGRI.GameEndCondition;
    CurrentRound = LPGRI.CurrentRound;
    RoundsToWin = LPGRI.RoundsToWin;
    RoundsWonTeam1 = LPGRI.RoundsWonTeam1;
    RoundsWonTeam2 = LPGRI.RoundsWonTeam2;
    Team1Index = LPGRI.Team1Index;
    bObjectiveActive = LPGRI.bObjectiveActive;
    ActiveMPObjective = LPGRI.ActiveMPObjective;
    Index = 0;
    J0x1B5:

    // End:0x20F [Loop If]
    if(Index < 5)
    {
        WinningTeamByRound[Index] = LPGRI.WinningTeamByRound[Index];
        Index++;
        // [Loop Continue]
        goto J0x1B5;
    }
    Index = 0;
    J0x21A:

    // End:0x274 [Loop If]
    if(Index < 4)
    {
        ObjectivesCompleted[Index] = LPGRI.ObjectivesCompleted[Index];
        Index++;
        // [Loop Continue]
        goto J0x21A;
    }
    //return;    
}

function WriteToGRI()
{
    local /*0x97E50000-0x00000000*/ private @NULL GRI[8388609];
    local /*0x97E50000-0x00000000*/ private int Index;
    local /*0x97E50000-0x00000000*/ private @NULL LPGRI;

    LPGRI = LPGRI_Base_MP(GRI);
    // End:0x2D
    if(LPGRI == none)
    {
        return;
    }
    super.WriteToGRI(LPGRI);
    LPGRI.GameStatus = GameStatus;
    LPGRI.GameEndCondition = GameEndCondition;
    LPGRI.CurrentRound = CurrentRound;
    LPGRI.RoundsToWin = RoundsToWin;
    LPGRI.RoundsWonTeam1 = RoundsWonTeam1;
    LPGRI.RoundsWonTeam2 = RoundsWonTeam2;
    LPGRI.Team1Index = Team1Index;
    LPGRI.bObjectiveActive = bObjectiveActive;
    LPGRI.ActiveMPObjective = ActiveMPObjective;
    Index = 0;
    J0x1B5:

    // End:0x20F [Loop If]
    if(Index < 5)
    {
        LPGRI.WinningTeamByRound[Index] = WinningTeamByRound[Index];
        Index++;
        // [Loop Continue]
        goto J0x1B5;
    }
    Index = 0;
    J0x21A:

    // End:0x274 [Loop If]
    if(Index < 4)
    {
        LPGRI.ObjectivesCompleted[Index] = ObjectivesCompleted[Index];
        Index++;
        // [Loop Continue]
        goto J0x21A;
    }
    //return;    
}
