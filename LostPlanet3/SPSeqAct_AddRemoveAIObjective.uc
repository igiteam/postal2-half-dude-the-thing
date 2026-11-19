class SPSeqAct_AddRemoveAIObjective extends SequenceAction
    abstract
    forcescriptorder(true)
    hidecategories(Object);

enum AddRemoveSPAIObjective_Status
{
    SPSeqObj_NotStarted,            // 0
    SPSeqObj_InProgrees,            // 1
    SPSeqObj_Succeeded,             // 2
    SPSeqObj_Failed,                // 3
    SPSeqObj_MAX                    // 4
};

var(__NotifyAccessLostDelegate__Delegate) /*0x05750000-0x00000400*/ private editfixedsize @NULL ObjectiveData[589825];
var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private bool ObjectiveDataCreated;
var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private byte ObjectiveStatus;

event NotifyObjectiveCompleted()
{
    local /*0x03A30000-0x00000000*/ private bool Success[9437185];

    true
    // End:0x21
    if(Success)
    {
        ObjectiveStatus = 2;        
    }
    else
    {
        ObjectiveStatus = 3;
    }
    //return;    
}

defaultproperties
{
    InputLinks[0]=(LinkDesc="Add Objective",bHasImpulse=false,QueuedActivations=0,bDisabled=false,bDisabledPIE=false,LinkedOp=none,DrawY=0,bHidden=false,ActivateDelay=0.0000000,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    InputLinks[1]=(LinkDesc="Remove Objective",bHasImpulse=false,QueuedActivations=0,bDisabled=false,bDisabledPIE=false,LinkedOp=none,DrawY=0,bHidden=false,ActivateDelay=0.0000000,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    ObjName="Add or Remove AI Objective (SP)"
}