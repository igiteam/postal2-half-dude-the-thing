class LPSeqAct_ChangeObjectiveMessagePriority extends SequenceAction
    forcescriptorder(true)
    hidecategories(Object);

var(0.25_Pct) /*0x90540000-0x00000000*/ private bool bIsSecondary[65537];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ObjectiveActor;

event array Activated()
{
    local /*0x97E50000-0x00000400*/ private @NULL ObjCompBase;
    local /*0x97E50000-0x00000400*/ private editfixedsize array CompList;

    // End:0x115
    if(ObjectiveActor != none)
    {
        ObjectiveActor.GetComponentsOfClass(Class'LPObjectiveComponentBase', CompList);
        // End:0x6E
        if(CompList.Length > 0)
        {
            ObjCompBase = LPObjectiveComponentBase(CompList[0]);
        }
        // End:0x112
        if(ObjCompBase != none)
        {
            // End:0xCD
            if(InputLinks[0].bHasImpulse)
            {
                ObjCompBase.SetAsPrimaryObjective(!bIsSecondary);                
            }
            else
            {
                // End:0x10F
                if(InputLinks[1].bHasImpulse)
                {
                    ObjCompBase.SetAsPrimaryObjective(true);
                }
            }            
        }        
    }
    OutputLinks[0].bHasImpulse = true;
    super(SequenceOp).Activated();
    //return;    
}

defaultproperties
{
    InputLinks[0]=(LinkDesc="Set Message As Secondary",bHasImpulse=false,QueuedActivations=0,bDisabled=false,bDisabledPIE=false,LinkedOp=none,DrawY=0,bHidden=false,ActivateDelay=0.0000000,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    InputLinks[1]=(LinkDesc="Restore Default",bHasImpulse=false,QueuedActivations=0,bDisabled=false,bDisabledPIE=false,LinkedOp=none,DrawY=0,bHidden=false,ActivateDelay=0.0000000,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    VariableLinks[0]=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=none,LinkDesc="Objective Actor",LinkVar="None",PropertyName="ObjectiveActor",bWriteable=false,bSequenceNeverReadsOnlyWritesToThisVar=false,bModifiesLinkedObject=false,bHidden=false,MinVars=1,MaxVars=255,DrawX=0,CachedProperty=none,bAllowAnyType=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    VariableLinks[1]=(ExpectedType=Class'Engine.SeqVar_Bool',LinkedVariables=none,LinkDesc="Is Secondary",LinkVar="None",PropertyName="bIsSecondary",bWriteable=false,bSequenceNeverReadsOnlyWritesToThisVar=false,bModifiesLinkedObject=false,bHidden=false,MinVars=1,MaxVars=255,DrawX=0,CachedProperty=none,bAllowAnyType=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    ObjName="Change Objective Message Priority (LP)"
}