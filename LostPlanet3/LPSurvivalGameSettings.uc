class LPSurvivalGameSettings extends LPOnlineGameSettings
    config(Game);

simulated function SetupDefaultParametersFromTuneData()
{
    local /*0x97E50000-0x00000000*/ private @NULL Params[8388609], P;

    P = LPTuneDataSurvivalGameSettings(Params);
    // End:0x193
    if(P != none)
    {
        SurvivalGameSettingsParams.AttackingTeam = P.Attackers.Current;
        SurvivalGameSettingsParams.AttackingTeamSpawnCount = ((P.AttackerSpawnCount.bInfinite) ? -1 : P.AttackerSpawnCount.Current);
        SurvivalGameSettingsParams.DefendingTeamSpawnCount = ((P.DefenderSpawnCount.bInfinite) ? -1 : P.DefenderSpawnCount.Current);
    }
    super.SetupDefaultParametersFromTuneData(Params);
    //return;    
}

simulated function CopyGameSettingsToBase()
{
    local /*0x97E50000-0x00000000*/ private @NULL Base[25165825];

    super.CopyGameSettingsToBase(Base);
    SurvivalGameSettingsParams.CopyParams(Base.SurvivalGameSettingsParams);
    //return;    
}

defaultproperties
{
    // Reference: LPOnlineGameSettingsParams'Default__LPSurvivalGameSettings.OnlineGameSettingsParams0'
    begin object name=OnlineGameSettingsParams0
    end object
    OnlineGameSettingsParams=OnlineGameSettingsParams0
    // Reference: LPScenarioGameSettingsParams'Default__LPSurvivalGameSettings.ScenarioGameSettingsParams0'
    begin object name=ScenarioGameSettingsParams0
    end object
    ScenarioGameSettingsParams=ScenarioGameSettingsParams0
    // Reference: LPExtractionGameSettingsParams'Default__LPSurvivalGameSettings.ExtractionGameSettingsParams0'
    begin object name=ExtractionGameSettingsParams0
    end object
    ExtractionGameSettingsParams=ExtractionGameSettingsParams0
    // Reference: LPTeamDeathmatchGameSettingsParams'Default__LPSurvivalGameSettings.TeamDeathmatchGameSettingsParams0'
    begin object name=TeamDeathmatchGameSettingsParams0
    end object
    TeamDeathmatchGameSettingsParams=TeamDeathmatchGameSettingsParams0
    // Reference: LPSurvivalGameSettingsParams'Default__LPSurvivalGameSettings.SurvivalGameSettingsParams0'
    begin object name=SurvivalGameSettingsParams0
    end object
    SurvivalGameSettingsParams=SurvivalGameSettingsParams0
    TuneDataOnlineGameSettings=SPTuneDataOnlineGameSettings'TuneData_OnlineSettings.TuneData_OnlineSettings_Survival'
    GameType=4
    ScoreLimit=50
    TimeLimit=11
    NumPublicConnections=6
    Properties=/* Array type was not detected. */
}