class LPSeqAct_GetBestiaryCategory extends SequenceAction
    forcescriptorder(true)
    hidecategories(Object);

event Activated()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPPC;

    // End:0xF0
    if(InputLinks[0].bHasImpulse)
    {
        // End:0xF0
        if(Targets.Length > 0)
        {
            LPPC = LPPlayerController(Targets[0]);
            // End:0xF0
            if(LPPC != none)
            {
                // End:0xF0
                if((LPPC.BestiaryItemSlot >= 0) && LPPC.BestiaryItemSlot < OutputLinks.Length)
                {
                    OutputLinks[LPPC.BestiaryItemSlot].bHasImpulse = true;
                }
            }
        }
    }
    //return;    
}

defaultproperties
{
    bAutoActivateOutputLinks=false
    OutputLinks[0]=(Links=none,LinkDesc="Cat S",bHasImpulse=false,bDisabled=false,bDisabledPIE=false,LinkedOp=none,ActivateDelay=0.0000000,DrawY=0,bHidden=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0,PIEActivationTime=0.0000000,bIsActivated=false)
    OutputLinks[1]=(Links=none,LinkDesc="Cat M",bHasImpulse=false,bDisabled=false,bDisabledPIE=false,LinkedOp=none,ActivateDelay=0.0000000,DrawY=0,bHidden=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0,PIEActivationTime=0.0000000,bIsActivated=false)
    OutputLinks[2]=(Links=none,LinkDesc="Cat L",bHasImpulse=false,bDisabled=false,bDisabledPIE=false,LinkedOp=none,ActivateDelay=0.0000000,DrawY=0,bHidden=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0,PIEActivationTime=0.0000000,bIsActivated=false)
    OutputLinks[3]=(Links=none,LinkDesc="Cat G",bHasImpulse=false,bDisabled=false,bDisabledPIE=false,LinkedOp=none,ActivateDelay=0.0000000,DrawY=0,bHidden=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0,PIEActivationTime=0.0000000,bIsActivated=false)
    ObjName="Get Bestiary Category (LP)"
}