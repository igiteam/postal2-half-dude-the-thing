class LPTuneDataOnlineGameSettings extends SPTuneDataOnlineGameSettingsParams
    abstract
    editinlinenew;

struct OnlineMatchGameDifficultyRangeParameter
{
    var(0.25_Pct) /*0x9C940000-0x00000000*/ private bool bPlayerOption[65537];
    var(0.25_Pct) /*0x9C940000-0x00000000*/ private byte Min[65537];
    var(0.25_Pct) /*0x9C940000-0x00000000*/ private byte Max[65537];
    var(0.25_Pct) /*0x9C940000-0x00000000*/ private byte Current[65537];

    structdefaultproperties
    {
        bPlayerOption=false
        Min=ESPDifficultyLevel.SPDL_Easy
        Max=ESPDifficultyLevel.SPDL_Easy
        Current=ESPDifficultyLevel.SPDL_Easy
    }
};

var(0.25_Pct) /*0x5BC50000-0x00000000*/ private @NULL MatchGameDifficulty[65537];
var(0.25_Pct) /*0x5BC50000-0x00000000*/ private @NULL RoundsToWin[65537];
var(0.25_Pct) /*0xBC760000-0x00000000*/ private float EnemyProximityToSpawn[65537];
var(0.25_Pct) /*0xBC760000-0x00000000*/ private float TeammateProximityToSpawn[65537];
var(0.25_Pct) /*0xBC760000-0x00000000*/ private float MinimumProximityToSpawn[65537];
var(0.25_Pct) /*0xBC760000-0x00000000*/ private float SpawnRatingBucket_Excellent[65537];
var(0.25_Pct) /*0xBC760000-0x00000000*/ private float SpawnRatingBucket_Good[65537];
var(0.25_Pct) /*0xBC760000-0x00000000*/ private float SpawnRatingBucket_Acceptable[65537];
var(0.25_Pct) /*0xBC760000-0x00000000*/ private float SpawnRatingBucket_Poor[65537];
var(0.25_Pct) /*0xBC760000-0x00000000*/ private float SpawnRatingWeight_Excellent[65537];
var(0.25_Pct) /*0xBC760000-0x00000000*/ private float SpawnRatingWeight_Good[65537];
var(0.25_Pct) /*0xBC760000-0x00000000*/ private float SpawnRatingWeight_Acceptable[65537];
var(0.25_Pct) /*0xBC760000-0x00000000*/ private float SpawnRatingWeight_Poor[65537];
var(0.25_Pct) /*0xBC760000-0x00000000*/ private float SpawnRuleValue_TeammateProximity[65537];
var(0.25_Pct) /*0xBC760000-0x00000000*/ private float SpawnRuleValue_PrimarySpawn[65537];
var(0.25_Pct) /*0xBC760000-0x00000000*/ private float SpawnRuleValue_LargeTeammatePresence[65537];
var(0.25_Pct) /*0xBC760000-0x00000000*/ private float SpawnRuleValue_SpawnOwner[65537];
var(0.25_Pct) /*0xBC760000-0x00000000*/ private float SpawnRuleValue_VisibleToTeammate[65537];
var(0.25_Pct) /*0xBC760000-0x00000000*/ private float SpawnRuleValue_LargeEnemyPresence[65537];
var(0.25_Pct) /*0xBC760000-0x00000000*/ private float SpawnRuleValue_EnemyProximity[65537];
var(0.25_Pct) /*0xBC760000-0x00000000*/ private float SpawnRuleValue_VisibleToEnemy[65537];
var(0.25_Pct) /*0xBC760000-0x00000000*/ private float SpawnRuleValue_Telefrag[65537];
var(0.25_Pct) /*0xBC760000-0x00000000*/ private float SpawnRuleValue_SpawnDisabled[65537];
var(0.25_Pct) /*0xAF8F0000-0x00000000*/ private bool bIncapacitatePlayerOnDeath[65537];
var(0.25_Pct) /*0xAF8F0000-0x00000000*/ private bool bScoreAkridKill[65537];
var(0.25_Pct) /*0xAF8F0000-0x00000000*/ private bool bTeamScoreAkridKill[65537];
var(0.25_Pct) /*0xAF8F0000-0x00000000*/ private bool bScorePlayerKill[65537];
var(0.25_Pct) /*0xAF8F0000-0x00000000*/ private bool bTeamScorePlayerKill[65537];
var(0.25_Pct) /*0xAF8F0000-0x00000000*/ private bool bScorePlayerSuicide[65537];
var(0.25_Pct) /*0xAF8F0000-0x00000000*/ private bool bTeamScorePlayerSuicide[65537];
var(0.25_Pct) /*0xAF8F0000-0x00000000*/ private bool bPlayerDeathAffectsScore[65537];
var(0.25_Pct) /*0xAF8F0000-0x00000000*/ private bool bPlayerDeathAffectsTeamScore[65537];
var(0.25_Pct) /*0xAF8F0000-0x00000000*/ private bool bThermalPickupsAccumulateTeamScore[65537];
var(0.25_Pct) /*0xAF8F0000-0x00000000*/ private bool bThermalPickupsAccumulateScore[65537];
var(0.25_Pct) /*0xAF8F0000-0x00000000*/ private bool bThermalExtractionAccumulateTeamScore[65537];
var(0.25_Pct) /*0xAF8F0000-0x00000000*/ private bool bThermalExtractionAccumulateScore[65537];
var(0.25_Pct) /*0xAF8F0000-0x00000000*/ private bool bAllowNegativePlayerScore[65537];
var(0.25_Pct) /*0xAF8F0000-0x00000000*/ private bool bAllowNegativeTeamScore[65537];

defaultproperties
{
    MatchGameDifficulty=(bPlayerOption=true,Min=ESPDifficultyLevel.SPDL_Easy,Max=ESPDifficultyLevel.SPDL_Hard,Current=ESPDifficultyLevel.SPDL_Normal)
    RoundsToWin=(bPlayerOption=true,Min=1,Max=5,Increment=1,Current=1)
    EnemyProximityToSpawn=2000.0000000
    TeammateProximityToSpawn=3000.0000000
    MinimumProximityToSpawn=100.0000000
    SpawnRatingBucket_Excellent=20.0000000
    SpawnRatingBucket_Good=8.0000000
    SpawnRatingBucket_Acceptable=-10.0000000
    SpawnRatingBucket_Poor=-30.0000000
    SpawnRatingWeight_Excellent=15.0000000
    SpawnRatingWeight_Good=7.0000000
    SpawnRatingWeight_Acceptable=2.0000000
    SpawnRatingWeight_Poor=0.2000000
    SpawnRuleValue_TeammateProximity=10.0000000
    SpawnRuleValue_PrimarySpawn=10.0000000
    SpawnRuleValue_LargeTeammatePresence=10.0000000
    SpawnRuleValue_SpawnOwner=10.0000000
    SpawnRuleValue_LargeEnemyPresence=-10.0000000
    SpawnRuleValue_EnemyProximity=-10.0000000
    SpawnRuleValue_VisibleToEnemy=-10.0000000
    SpawnRuleValue_Telefrag=-100.0000000
    SpawnRuleValue_SpawnDisabled=-100.0000000
    bIncapacitatePlayerOnDeath=true
    bTeamScoreAkridKill=true
    bScorePlayerKill=true
    bTeamScorePlayerKill=true
    bScorePlayerSuicide=true
    bTeamScorePlayerSuicide=true
    bPlayerDeathAffectsScore=true
    bPlayerDeathAffectsTeamScore=true
    bAllowNegativePlayerScore=true
    TimeLimit=(bPlayerOption=true,Min=5,Max=15,Increment=5,Current=10)
    GoalScore=(bPlayerOption=true,Min=10,Max=100,Increment=5,Current=25)
    FriendlyFire=(bPlayerOption=true,Max=1,Increment=1)
    PlayerCount=(bPlayerOption=true,Min=1,Max=5,Increment=1,Current=5)
}