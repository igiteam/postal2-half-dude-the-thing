class LPSurvivalGameSettingsParams extends Object
    config(Game);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte AttackingTeam[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int AttackingTeamSpawnCount[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int DefendingTeamSpawnCount[1073741825];

simulated function GetAttackingTeam()
{
    local /*0x97E50000-0x00000000*/ private byte ReturnValue[92274689];

    return AttackingTeam;
    //return ReturnValue;    
}

simulated function SetAttackingTeam()
{
    local /*0x97E50000-0x00000000*/ private byte Value[8388609];

    AttackingTeam = Value;
    //return;    
}

simulated function GetAttackingTeamSpawnCount()
{
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];

    return AttackingTeamSpawnCount;
    //return ReturnValue;    
}

simulated function SetAttackingTeamSpawnCount()
{
    local /*0x97E50000-0x00000000*/ private int Value[8388609];

    AttackingTeamSpawnCount = Value;
    //return;    
}

simulated function GetDefendingTeamSpawnCount()
{
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];

    return DefendingTeamSpawnCount;
    //return ReturnValue;    
}

simulated function SetDefendingTeamSpawnCount()
{
    local /*0x97E50000-0x00000000*/ private int Value[8388609];

    DefendingTeamSpawnCount = Value;
    //return;    
}

simulated function CopyParams()
{
    local /*0x97E50000-0x00000000*/ private @NULL Target[25165825];

    Target.SetAttackingTeam(GetAttackingTeam());
    Target.SetAttackingTeamSpawnCount(GetAttackingTeamSpawnCount());
    Target.SetDefendingTeamSpawnCount(GetDefendingTeamSpawnCount());
    //return;    
}
