class LPGameMP_DM extends LPGameMP_Base
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

    // End:0x53
    if(Scorer.Score >= float(GoalScore))
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
    SpawnRuleValue_TeammateProximity=-10.0000000
    SpawnRuleValue_PrimarySpawn=0.0000000
    SpawnRuleValue_LargeTeammatePresence=-10.0000000
    SpawnRuleValue_SpawnOwner=0.0000000
    SpawnRuleValue_VisibleToTeammate=-10.0000000
    bIncapacitatePlayerOnDeath=false
    // Reference: LPTrueSkillCalculator'Default__LPGameMP_DM.PlayerRankCalculator0'
    begin object name=PlayerRankCalculator0
    end object
    PlayerRankCalculator=PlayerRankCalculator0
    NumTeams=1
    bAllowFriendlyFire=true
    // Reference: SPAIVisibilityManager'Default__LPGameMP_DM.VisMan0'
    begin object name=VisMan0
    end object
    AIVisMan=VisMan0
    GoalScore=100
    TimeLimit=10
    GameReplicationInfoClass=Class'LPGRI_DM_MP'
}