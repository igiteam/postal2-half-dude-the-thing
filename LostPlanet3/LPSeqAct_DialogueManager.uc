class LPSeqAct_DialogueManager extends SPSeqAct_DialogueManager
    forcescriptorder(true)
    hidecategories(Object);

var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL IdleObjectiveData[524289];

event AddDialogueManagerObjective()
{
    local /*0x97E50000-0x00000000*/ private @NULL BaseAIController[25165825], AIController;

    AIController = SPAIController(BaseAIController);
    // End:0xC2
    if(((IdleObjectiveData != none) && AIController != none) && AIController.AIObjectiveManager != none)
    {
        IdleObjectiveData.Action = self;
        AIController.AIObjectiveManager.AddAIObjectiveFromKismet(IdleObjectiveData);        
    }
    else
    {
        AIController = none;
    }
    //return;    
}

event RemoveDialogueManagerObjective()
{
    local /*0x97E50000-0x00000000*/ private @NULL BaseAIController[8388609], AIController;

    AIController = SPAIController(BaseAIController);
    // End:0x9F
    if(((IdleObjectiveData != none) && AIController != none) && AIController.AIObjectiveManager != none)
    {
        AIController.AIObjectiveManager.RemoveAIObjectiveFromKismet(IdleObjectiveData);
    }
    //return;    
}

event CleanUpActionScript()
{
    // End:0x3A
    if(IdleObjectiveData != none)
    {
        IdleObjectiveData.Action = none;
        IdleObjectiveData = none;
    }
    //return;    
}

defaultproperties
{
    // Reference: LPAIOD_DialogueManagerIdle'Default__LPSeqAct_DialogueManager.LPAIOD_DialogueManagerIdle0'
    begin object name=LPAIOD_DialogueManagerIdle0 class=Class'LPAIOD_DialogueManagerIdle'
    end object
    IdleObjectiveData=LPAIOD_DialogueManagerIdle0
    ObjName="Dialogue Manager (LP)"
}