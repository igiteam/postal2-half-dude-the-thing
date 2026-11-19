class LPQO_ObjectiveFastTravel extends LPQO_ObjectiveBool
    editinlinenew
    hidecategories(Object,Object)
    autoexpandcategories(SPQuestObject_Base,SPQO_Objective);

var(0.25_Pct) /*0xD26E0000-0x00000000*/ private editfixedsize string TravelURL[65537];
var(0.25_Pct) /*0xD26E0000-0x00000000*/ private name MapZoneName[65537];

event ShowStatusChangedUI()
{
    local /*0x97E50000-0x00000000*/ private byte NewStatus[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL LP, LPPC;

    // End:0xD8
    if((int(NewStatus) == int(3)) || int(NewStatus) == int(2))
    {
        LP = Class'Engine.UIInteraction'.static.GetLocalPlayer(0);
        // End:0xD8
        if(LP != none)
        {
            LPPC = LPPlayerController(LP.Actor);
            // End:0xD8
            if(LPPC != none)
            {
                LPPC.myLPHUD.ShowLocationDiscoveredMessage(self);
            }
        }
    }
    //return;    
}

defaultproperties
{
    // Reference: LPQP_None'Default__LPQO_ObjectiveFastTravel.DefaultPrereqA'
    begin object name=DefaultPrereqA
    end object
    Prerequisite=DefaultPrereqA
    PlayerVisibilityType=EQuestObjectiveVisibilityType.EQOVT_QuestUnlockedAndPrereqsSatisfied
    ProgressTrackingType=EQuestObjectiveProgressTrackingType.EQOPT_QuestUnlockedAndPrereqsSatisfied
}