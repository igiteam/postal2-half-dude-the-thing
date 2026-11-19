class LPSeqAct_GetMPGameMode extends SequenceAction
    forcescriptorder(true)
    hidecategories(Object);

event Activated()
{
    local /*0x97E50000-0x00000000*/ private class GI;
    local /*0x97E50000-0x00000000*/ private int Index;

    GI = Class'Engine.WorldInfo'.static.GetWorldInfo().GetGameClass();
    Index = 6;
    // End:0x73
    if(ClassIsChildOf(GI, Class'LPGameMP_Extraction'))
    {
        Index = 2;        
    }
    else
    {
        // End:0x9A
        if(ClassIsChildOf(GI, Class'LPGameMP_Scenario'))
        {
            Index = 3;            
        }
        else
        {
            // End:0xC1
            if(ClassIsChildOf(GI, Class'LPGameMP_COOP'))
            {
                Index = 4;                
            }
            else
            {
                // End:0xE7
                if(ClassIsChildOf(GI, Class'LPGameMP_DM'))
                {
                    Index = 0;                    
                }
                else
                {
                    // End:0x10E
                    if(ClassIsChildOf(GI, Class'LPGameMP_Survival'))
                    {
                        Index = 5;                        
                    }
                    else
                    {
                        // End:0x131
                        if(ClassIsChildOf(GI, Class'LPGameMP_TDM'))
                        {
                            Index = 1;
                        }
                    }
                }
            }
        }
    }
    OutputLinks[Index].bHasImpulse = true;
    //return;    
}

defaultproperties
{
    bAutoActivateOutputLinks=false
    OutputLinks[0]=(Links=none,LinkDesc="Death Match",bHasImpulse=false,bDisabled=false,bDisabledPIE=false,LinkedOp=none,ActivateDelay=0.0000000,DrawY=0,bHidden=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0,PIEActivationTime=0.0000000,bIsActivated=false)
    OutputLinks[1]=(Links=none,LinkDesc="Team Death Match",bHasImpulse=false,bDisabled=false,bDisabledPIE=false,LinkedOp=none,ActivateDelay=0.0000000,DrawY=0,bHidden=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0,PIEActivationTime=0.0000000,bIsActivated=false)
    OutputLinks[2]=(Links=none,LinkDesc="Extraction",bHasImpulse=false,bDisabled=false,bDisabledPIE=false,LinkedOp=none,ActivateDelay=0.0000000,DrawY=0,bHidden=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0,PIEActivationTime=0.0000000,bIsActivated=false)
    OutputLinks[3]=(Links=none,LinkDesc="Scenario",bHasImpulse=false,bDisabled=false,bDisabledPIE=false,LinkedOp=none,ActivateDelay=0.0000000,DrawY=0,bHidden=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0,PIEActivationTime=0.0000000,bIsActivated=false)
    OutputLinks[4]=(Links=none,LinkDesc="CO-OP",bHasImpulse=false,bDisabled=false,bDisabledPIE=false,LinkedOp=none,ActivateDelay=0.0000000,DrawY=0,bHidden=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0,PIEActivationTime=0.0000000,bIsActivated=false)
    OutputLinks[5]=(Links=none,LinkDesc="Survival",bHasImpulse=false,bDisabled=false,bDisabledPIE=false,LinkedOp=none,ActivateDelay=0.0000000,DrawY=0,bHidden=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0,PIEActivationTime=0.0000000,bIsActivated=false)
    OutputLinks[6]=(Links=none,LinkDesc="Unsupported",bHasImpulse=false,bDisabled=false,bDisabledPIE=false,LinkedOp=none,ActivateDelay=0.0000000,DrawY=0,bHidden=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0,PIEActivationTime=0.0000000,bIsActivated=false)
    ObjName="Get MP Game Mode (LP)"
}