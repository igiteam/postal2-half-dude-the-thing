class LPGameMP_Extraction extends LPGameMP_TDM
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
        if((LPExtractionGameSettings(GameSettings) == none) && DataStoreGameSettings != none)
        {
            DataStoreGameSettings.SetCurrentByName('ExtractionLAN');
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
    MyGameSettings = LPExtractionGameSettings(GetGameSettingsObject());
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
    TD = LPTuneDataExtractionGameSettings(MyGameSettings.TuneDataOnlineGameSettings.FindParameterSet(name(WorldInfo.GetMapName()), true, MyGameSettings));
    // End:0xE3
    if(TD == none)
    {
        return false;
    }
    return true;
    //return ReturnValue;    
}

defaultproperties
{
    bScorePlayerKill=false
    bTeamScorePlayerKill=false
    bThermalExtractionAccumulateTeamScore=true
    // Reference: LPTrueSkillCalculator'Default__LPGameMP_Extraction.PlayerRankCalculator0'
    begin object name=PlayerRankCalculator0
    end object
    PlayerRankCalculator=PlayerRankCalculator0
    PlayerRankCalculatorClass=Class'LPTrueSkillCalculatorExtraction'
    // Reference: SPAIVisibilityManager'Default__LPGameMP_Extraction.VisMan0'
    begin object name=VisMan0
    end object
    AIVisMan=VisMan0
    GoalScore=500
    TimeLimit=15
    GameReplicationInfoClass=Class'LPGRI_Extraction_MP'
}