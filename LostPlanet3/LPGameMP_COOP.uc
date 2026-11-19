class LPGameMP_COOP extends LPGameMP_Base
    abstract
    config(Game)
    hidecategories(AnimDependency,Navigation,Movement,Collision);

static event SetGameType()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string MapName[8388609], Options, Portal;
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];

    return default.Class;
    //return ReturnValue;    
}

function PickTeam()
{
    local /*0x97E50000-0x00000000*/ private byte Current[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL C[8388609];
    local /*0x97E50000-0x00000000*/ private byte ReturnValue[92274689];

    return 0;
    //return ReturnValue;    
}

function CheckScore()
{
    local /*0x97E50000-0x00000000*/ private @NULL Scorer[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x8E
    if((Scorer.Team != none) && Scorer.Team.Score >= float(GoalScore))
    {
        EndGame(Scorer, "teamscorelimit");
        return true;
    }
    return super.CheckScore(Scorer);
    //return ReturnValue;    
}

function SetGameRules()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    super.SetGameRules();
    return true;
    //return ReturnValue;    
}

defaultproperties
{
    // Reference: LPTrueSkillCalculator'Default__LPGameMP_COOP.PlayerRankCalculator0'
    begin object name=PlayerRankCalculator0
    end object
    PlayerRankCalculator=PlayerRankCalculator0
    NumTeams=1
    // Reference: SPAIVisibilityManager'Default__LPGameMP_COOP.VisMan0'
    begin object name=VisMan0
    end object
    AIVisMan=VisMan0
    GoalScore=9999999
    GameReplicationInfoClass=Class'LPGRI_COOP_MP'
}