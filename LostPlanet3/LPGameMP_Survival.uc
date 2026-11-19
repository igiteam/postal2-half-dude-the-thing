class LPGameMP_Survival extends LPGameMP_TDM
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
        if((LPSurvivalGameSettings(GameSettings) == none) && DataStoreGameSettings != none)
        {
            DataStoreGameSettings.SetCurrentByName('SurvivalLAN');
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
    AttackingTeamIndex = int(MyGameSettings.SurvivalGameSettingsParams.GetAttackingTeam());
    TeamLives.Attackers = MyGameSettings.SurvivalGameSettingsParams.GetAttackingTeamSpawnCount();
    TeamLives.Defenders = MyGameSettings.SurvivalGameSettingsParams.GetDefendingTeamSpawnCount();
    // End:0x140
    if(MyGameSettings.TuneDataOnlineGameSettings == none)
    {
        return false;
    }
    TD = LPTuneDataSurvivalGameSettings(MyGameSettings.TuneDataOnlineGameSettings.FindParameterSet(name(WorldInfo.GetMapName()), true, MyGameSettings));
    // End:0x1C5
    if(TD == none)
    {
        return false;
    }
    return true;
    //return ReturnValue;    
}

defaultproperties
{
    TeamLives=(Attackers=25,Defenders=25)
    // Reference: LPTrueSkillCalculator'Default__LPGameMP_Survival.PlayerRankCalculator0'
    begin object name=PlayerRankCalculator0
    end object
    PlayerRankCalculator=PlayerRankCalculator0
    PlayerRankCalculatorClass=Class'LPTrueSkillCalculatorSurvival'
    NumTeams=3
    // Reference: SPAIVisibilityManager'Default__LPGameMP_Survival.VisMan0'
    begin object name=VisMan0
    end object
    AIVisMan=VisMan0
    GameReplicationInfoClass=Class'LPGRI_Survival_MP'
}