class LPScenarioGameSettings extends LPOnlineGameSettings
    config(Game);

simulated function SetupDefaultParametersFromTuneData()
{
    local /*0x97E50000-0x00000000*/ private @NULL Params[8388609], P;

    P = LPTuneDataScenarioGameSettings(Params);
    // End:0x20F
    if(P != none)
    {
        ScenarioGameSettingsParams.AttackingTeam = P.Attackers.Current;
        ScenarioGameSettingsParams.bDualAttackers = P.bDualAttackers;
        ScenarioGameSettingsParams.AttackingTeamSpawnCount = ((P.AttackerSpawnCount.bInfinite) ? -1 : P.AttackerSpawnCount.Current);
        ScenarioGameSettingsParams.DefendingTeamSpawnCount = ((P.DefenderSpawnCount.bInfinite) ? -1 : P.DefenderSpawnCount.Current);
        ScenarioGameSettingsParams.WinCondition = P.WinCondition;
    }
    super.SetupDefaultParametersFromTuneData(Params);
    //return;    
}

simulated function CopyGameSettingsToBase()
{
    local /*0x97E50000-0x00000000*/ private @NULL Base[25165825];

    super.CopyGameSettingsToBase(Base);
    ScenarioGameSettingsParams.CopyParams(Base.ScenarioGameSettingsParams);
    //return;    
}

defaultproperties
{
    // Reference: LPOnlineGameSettingsParams'Default__LPScenarioGameSettings.OnlineGameSettingsParams0'
    begin object name=OnlineGameSettingsParams0
    end object
    OnlineGameSettingsParams=OnlineGameSettingsParams0
    // Reference: LPScenarioGameSettingsParams'Default__LPScenarioGameSettings.ScenarioGameSettingsParams0'
    begin object name=ScenarioGameSettingsParams0
    end object
    ScenarioGameSettingsParams=ScenarioGameSettingsParams0
    // Reference: LPExtractionGameSettingsParams'Default__LPScenarioGameSettings.ExtractionGameSettingsParams0'
    begin object name=ExtractionGameSettingsParams0
    end object
    ExtractionGameSettingsParams=ExtractionGameSettingsParams0
    // Reference: LPTeamDeathmatchGameSettingsParams'Default__LPScenarioGameSettings.TeamDeathmatchGameSettingsParams0'
    begin object name=TeamDeathmatchGameSettingsParams0
    end object
    TeamDeathmatchGameSettingsParams=TeamDeathmatchGameSettingsParams0
    // Reference: LPSurvivalGameSettingsParams'Default__LPScenarioGameSettings.SurvivalGameSettingsParams0'
    begin object name=SurvivalGameSettingsParams0
    end object
    SurvivalGameSettingsParams=SurvivalGameSettingsParams0
    TuneDataOnlineGameSettings=SPTuneDataOnlineGameSettings'TuneData_OnlineSettings.TuneData_OnlineSettings_Scenario'
    GameType=2
    TimeLimit=15
    Properties=/* Array type was not detected. */
}