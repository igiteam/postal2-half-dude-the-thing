class LPQO_ObjectiveSurveyMapLocation extends LPQO_ObjectiveBool
    editinlinenew
    hidecategories(Object,Object)
    autoexpandcategories(SPQuestObject_Base,SPQO_Objective);

struct native LocalMapLocation
{
    var(0.25_Pct) /*0x758C0000-0x00000000*/ private editfixedsize string MapMovieClipName[65537];
    var(0.25_Pct) /*0x758C0000-0x00000000*/ private @NULL MapLocation[65537];

    structdefaultproperties
    {
        MapMovieClipName=""
        MapLocation=(X=0.0000000,Y=0.0000000,Z=0.0000000)
    }
};

var(0.25_Pct) /*0x820B0000-0x00000000*/ private @NULL WorldMapLocation[65537];
var(0.25_Pct) /*0x820B0000-0x00000000*/ private editfixedsize array LocalMapLocations[65537];

defaultproperties
{
    // Reference: LPQP_None'Default__LPQO_ObjectiveSurveyMapLocation.DefaultPrereqA'
    begin object name=DefaultPrereqA
    end object
    Prerequisite=DefaultPrereqA
    PlayerVisibilityType=EQuestObjectiveVisibilityType.EQOVT_QuestUnlockedAndPrereqsSatisfied
    ProgressTrackingType=EQuestObjectiveProgressTrackingType.EQOPT_QuestUnlockedAndPrereqsSatisfied
}