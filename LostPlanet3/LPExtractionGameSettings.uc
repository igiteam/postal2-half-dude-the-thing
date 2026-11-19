class LPExtractionGameSettings extends LPOnlineGameSettings
    config(Game);

simulated function SetupDefaultParametersFromTuneData()
{
    local /*0x97E50000-0x00000000*/ private @NULL Params[8388609], P;

    P = LPTuneDataExtractionGameSettings(Params);
    // End:0x2B
    if(P != none)
    {
    }
    super.SetupDefaultParametersFromTuneData(Params);
    //return;    
}

simulated function CopyGameSettingsToBase()
{
    local /*0x97E50000-0x00000000*/ private @NULL Base[25165825];

    super.CopyGameSettingsToBase(Base);
    ExtractionGameSettingsParams.CopyParams(Base.ExtractionGameSettingsParams);
    //return;    
}

defaultproperties
{
    // Reference: LPOnlineGameSettingsParams'Default__LPExtractionGameSettings.OnlineGameSettingsParams0'
    begin object name=OnlineGameSettingsParams0
    end object
    OnlineGameSettingsParams=OnlineGameSettingsParams0
    // Reference: LPScenarioGameSettingsParams'Default__LPExtractionGameSettings.ScenarioGameSettingsParams0'
    begin object name=ScenarioGameSettingsParams0
    end object
    ScenarioGameSettingsParams=ScenarioGameSettingsParams0
    // Reference: LPExtractionGameSettingsParams'Default__LPExtractionGameSettings.ExtractionGameSettingsParams0'
    begin object name=ExtractionGameSettingsParams0
    end object
    ExtractionGameSettingsParams=ExtractionGameSettingsParams0
    // Reference: LPTeamDeathmatchGameSettingsParams'Default__LPExtractionGameSettings.TeamDeathmatchGameSettingsParams0'
    begin object name=TeamDeathmatchGameSettingsParams0
    end object
    TeamDeathmatchGameSettingsParams=TeamDeathmatchGameSettingsParams0
    // Reference: LPSurvivalGameSettingsParams'Default__LPExtractionGameSettings.SurvivalGameSettingsParams0'
    begin object name=SurvivalGameSettingsParams0
    end object
    SurvivalGameSettingsParams=SurvivalGameSettingsParams0
    TuneDataOnlineGameSettings=SPTuneDataOnlineGameSettings'TuneData_OnlineSettings.TuneData_OnlineSettings_Extraction'
    GameType=1
    ScoreLimit=500
    TimeLimit=15
    Properties=/* Array type was not detected. */
}