class LPQO_ObjectiveMailMessage extends LPQO_ObjectiveBool
    editinlinenew
    hidecategories(Object,Object)
    autoexpandcategories(SPQuestObject_Base,SPQO_Objective);

var(0.25_Pct) /*0x82090000-0x00000400*/ private editfixedsize @NULL Message[589825];
var(0.25_Pct) /*0x82090000-0x00000000*/ private bool bMasterCataloger[65537];
var(0.25_Pct) /*0xD0210000-0x00000000*/ private bool bSentMessage[65537];

event ShowStatusChangedUI()
{
    local /*0x97E50000-0x00000000*/ private byte NewStatus[8388609];

    LPQDD_Bool(DynamicData).bItemViewedInJobLog = false;
    Message.ShowStatusChangedUI(NewStatus);
    //return;    
}

defaultproperties
{
    bMasterCataloger=true
    // Reference: LPQP_None'Default__LPQO_ObjectiveMailMessage.DefaultPrereqA'
    begin object name=DefaultPrereqA
    end object
    Prerequisite=DefaultPrereqA
    PlayerVisibilityType=EQuestObjectiveVisibilityType.EQOVT_QuestUnlockedAndPrereqsSatisfied
    ProgressTrackingType=EQuestObjectiveProgressTrackingType.EQOPT_QuestUnlockedAndPrereqsSatisfied
    DynamicDataClass=Class'LPQDD_MailMessage'
}