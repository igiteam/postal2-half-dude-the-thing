class LPGameMP_Scenario extends LPGameMP_TDM
    abstract
    config(Game)
    hidecategories(AnimDependency,Navigation,Movement,Collision);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte WinCondition;

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
        if((LPScenarioGameSettings(GameSettings) == none) && DataStoreGameSettings != none)
        {
            DataStoreGameSettings.SetCurrentByName('ScenarioLAN');
        }
    }
    return default.Class;
    //return ReturnValue;    
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
    AttackingTeamIndex = int(MyGameSettings.ScenarioGameSettingsParams.GetAttackingTeam());
    bDualAttackers = MyGameSettings.ScenarioGameSettingsParams.GetDualAttackers();
    TeamLives.Attackers = MyGameSettings.ScenarioGameSettingsParams.GetAttackingTeamSpawnCount();
    TeamLives.Defenders = MyGameSettings.ScenarioGameSettingsParams.GetDefendingTeamSpawnCount();
    // End:0x1D8
    if(IsWinConditionSupported(MyGameSettings.ScenarioGameSettingsParams.GetWinCondition()))
    {
        WinCondition = MyGameSettings.ScenarioGameSettingsParams.GetWinCondition();
    }
    // End:0x1FE
    if(MyGameSettings.TuneDataOnlineGameSettings == none)
    {
        return false;
    }
    TD = LPTuneDataScenarioGameSettings(MyGameSettings.TuneDataOnlineGameSettings.FindParameterSet(name(WorldInfo.GetMapName()), true, MyGameSettings));
    // End:0x283
    if(TD == none)
    {
        return false;
    }
    return true;
    //return ReturnValue;    
}

function IsWinConditionSupported()
{
    local /*0x97E50000-0x00000000*/ private byte Condition[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    switch(Condition)
    {
        // End:0x18
        case 5:
        // End:0x1F
        case 7:
            return true;
        // End:0xFFFF
        default:
            return false;
            break;
    }
    //return ReturnValue;    
}

function InitGameReplicationInfo()
{
    local /*0x97E50000-0x00000000*/ private @NULL GRI;

    super(LPGameMP_Base).InitGameReplicationInfo();
    GRI = LPGRI_Base_MP(GetGRI());
    // End:0x71
    if(GRI != none)
    {
        GRI.GameEndCondition.WinCondition = WinCondition;
    }
    //return;    
}

defaultproperties
{
    WinCondition=eEndGameWinCondition.eEndGameWinCondition_ObjectivesMet
    bPlayerDeathAffectsTeamScore=true
    TeamLives=(Attackers=50)
    AttackingTeamIndex=0
    // Reference: LPTrueSkillCalculator'Default__LPGameMP_Scenario.PlayerRankCalculator0'
    begin object name=PlayerRankCalculator0
    end object
    PlayerRankCalculator=PlayerRankCalculator0
    PlayerRankCalculatorClass=Class'LPTrueSkillCalculatorScenario'
    // Reference: SPAIVisibilityManager'Default__LPGameMP_Scenario.VisMan0'
    begin object name=VisMan0
    end object
    AIVisMan=VisMan0
    GoalScore=500
    TimeLimit=15
    GameReplicationInfoClass=Class'LPGRI_Scenario_MP'
}