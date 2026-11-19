class LPCommendation_Impregnable extends LPCommendation;

function GetCommendationValueForPlayer()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPPC[8388609];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL ScenarioGRI, MyTeamInfo;

    ScenarioGRI = LPGRI_Scenario_MP(LPPC.WorldInfo.GRI);
    // End:0x17C
    if((ScenarioGRI != none) && int(ScenarioGRI.GameEndCondition.WinCondition) == int(5))
    {
        MyTeamInfo = LPTeamInfo_MP(ScenarioGRI.Teams[int(LPPC.GetTeamNum())]);
        // End:0x17C
        if((MyTeamInfo != none) && MyTeamInfo.bDualAttackers || !MyTeamInfo.bAttackingTeam)
        {
            return ((LPPC.EvalStat('Stat_NumObjectivesLost', 1) > 0) ? 0.0000000 : 1.0000000);
        }
    }
    return 0.0000000;
    //return ReturnValue;    
}
