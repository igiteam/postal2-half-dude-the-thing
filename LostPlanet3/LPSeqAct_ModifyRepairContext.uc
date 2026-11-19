class LPSeqAct_ModifyRepairContext extends SequenceAction
    forcescriptorder(true)
    hidecategories(Object);

var(0.25_Pct) /*0x82E20000-0x00000400*/ private editfixedsize @NULL ContextSelector[589825];
var(0.25_Pct) /*0x82E20000-0x00000000*/ private float Health[65537];

event @NULL Activated()
{
    local /*0x97E50000-0x00000000*/ private @NULL targetObject, TargetActor;
    local /*0x97E50000-0x00000000*/ private int iIndex;
    local /*0x97E50000-0x00000400*/ private @NULL RepairComp;

    // End:0x12
    if(Targets.Length == 0)
    {
        return;
    }
    // End:0x156
    foreach Targets(targetObject, iIndex)
    {
        TargetActor = Actor(targetObject);
        RepairComp = Class'LPSM_PlayerRepairBase'.static.GetRepairComponent(TargetActor);
        // End:0x92
        if(RepairComp == none)
        {
            continue;            
        }
        else
        {
            // End:0x109
            if(InputLinks[0].bHasImpulse)
            {
                RepairComp.ContextSelector.SelectedIndex = ContextSelector.SelectedIndex;                
            }
            else
            {
                // End:0x155
                if(InputLinks[1].bHasImpulse)
                {
                    RepairComp.SetHealthDirectly(int(Health));
                }
            }            
        }
    }    
    //return;    
}

defaultproperties
{
    // Reference: LPQueryAnimNodeTemplateLogicRepairContext'Default__LPSeqAct_ModifyRepairContext.ContextSelector0'
    begin object name=ContextSelector0 class=Class'LPQueryAnimNodeTemplateLogicRepairContext'
    end object
    ContextSelector=ContextSelector0
    InputLinks[0]=(LinkDesc="Modify Context",bHasImpulse=false,QueuedActivations=0,bDisabled=false,bDisabledPIE=false,LinkedOp=none,DrawY=0,bHidden=false,ActivateDelay=0.0000000,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    InputLinks[1]=(LinkDesc="Modify Health",bHasImpulse=false,QueuedActivations=0,bDisabled=false,bDisabledPIE=false,LinkedOp=none,DrawY=0,bHidden=false,ActivateDelay=0.0000000,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    ObjName="Modify Repair (LP)"
}