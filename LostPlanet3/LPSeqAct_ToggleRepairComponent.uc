class LPSeqAct_ToggleRepairComponent extends SequenceAction
    forcescriptorder(true)
    hidecategories(Object);

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
    // End:0x183
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
            // End:0xD8
            if(InputLinks[0].bHasImpulse)
            {
                RepairComp.bRepairable = true;                
            }
            else
            {
                // End:0x11E
                if(InputLinks[1].bHasImpulse)
                {
                    RepairComp.bRepairable = false;                    
                }
                else
                {
                    // End:0x182
                    if(InputLinks[2].bHasImpulse)
                    {
                        RepairComp.bRepairable = !RepairComp.bRepairable;
                    }
                }
            }            
        }
    }    
    //return;    
}

defaultproperties
{
    InputLinks[0]=(LinkDesc="On",bHasImpulse=false,QueuedActivations=0,bDisabled=false,bDisabledPIE=false,LinkedOp=none,DrawY=0,bHidden=false,ActivateDelay=0.0000000,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    InputLinks[1]=(LinkDesc="Off",bHasImpulse=false,QueuedActivations=0,bDisabled=false,bDisabledPIE=false,LinkedOp=none,DrawY=0,bHidden=false,ActivateDelay=0.0000000,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    InputLinks[2]=(LinkDesc="Toggle",bHasImpulse=false,QueuedActivations=0,bDisabled=false,bDisabledPIE=false,LinkedOp=none,DrawY=0,bHidden=false,ActivateDelay=0.0000000,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    ObjName="Toggle Repair Component (LP)"
}