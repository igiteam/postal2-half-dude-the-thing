class LPTeamDeathmatchGameSettings extends LPOnlineGameSettings
    config(Game);

simulated function SetupDefaultParametersFromTuneData()
{
    local /*0x97E50000-0x00000000*/ private @NULL Params[8388609], P;

    P = LPTuneDataTeamDeathmatchGameSettings(Params);
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
    TeamDeathmatchGameSettingsParams.CopyParams(Base.TeamDeathmatchGameSettingsParams);
    //return;    
}

defaultproperties
{
    // Reference: LPOnlineGameSettingsParams'Default__LPTeamDeathmatchGameSettings.OnlineGameSettingsParams0'
    begin object name=OnlineGameSettingsParams0
    end object
    OnlineGameSettingsParams=OnlineGameSettingsParams0
    // Reference: LPScenarioGameSettingsParams'Default__LPTeamDeathmatchGameSettings.ScenarioGameSettingsParams0'
    begin object name=ScenarioGameSettingsParams0
    end object
    ScenarioGameSettingsParams=ScenarioGameSettingsParams0
    // Reference: LPExtractionGameSettingsParams'Default__LPTeamDeathmatchGameSettings.ExtractionGameSettingsParams0'
    begin object name=ExtractionGameSettingsParams0
    end object
    ExtractionGameSettingsParams=ExtractionGameSettingsParams0
    // Reference: LPTeamDeathmatchGameSettingsParams'Default__LPTeamDeathmatchGameSettings.TeamDeathmatchGameSettingsParams0'
    begin object name=TeamDeathmatchGameSettingsParams0
    end object
    TeamDeathmatchGameSettingsParams=TeamDeathmatchGameSettingsParams0
    // Reference: LPSurvivalGameSettingsParams'Default__LPTeamDeathmatchGameSettings.SurvivalGameSettingsParams0'
    begin object name=SurvivalGameSettingsParams0
    end object
    SurvivalGameSettingsParams=SurvivalGameSettingsParams0
    TuneDataOnlineGameSettings=SPTuneDataOnlineGameSettings'TuneData_OnlineSettings.TuneData_OnlineSettings_TDM'
    GameType=3
    ScoreLimit=50
    TimeLimit=12
    Properties=/* Array type was not detected. */
}