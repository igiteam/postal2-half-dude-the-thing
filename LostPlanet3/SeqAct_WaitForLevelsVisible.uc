class SeqAct_WaitForLevelsVisible extends SeqAct_Latent
    hidecategories(Object);

var(*) /*0x444E0000-0x00000000*/ private editfixedsize array LevelNames[65537];
var(*) /*0x444E0000-0x00000000*/ private bool bShouldBlockOnLoad[65537];

// Export USeqAct_WaitForLevelsVisible::execCheckLevelsVisible(FFrame&, void* const)
native final function CheckLevelsVisible()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

event Activated()
{
    local /*0x35EA0000-0x00000000*/ private @NULL PC;

    // End:0xB2
    foreach GetWorldInfo().AllControllers(Class'PlayerController', PC)
    {
        // End:0xB1
        if((NetConnection(PC.Player) != none) && ChildConnection(PC.Player) == none)
        {
            PC.ClientWaitForLevelsVisible(self);
        }        
    }    
    //return;    
}

defaultproperties
{
    bShouldBlockOnLoad=true
    InputLinks[0]=(LinkDesc="Wait",bHasImpulse=false,QueuedActivations=0,bDisabled=false,bDisabledPIE=false,LinkedOp=none,DrawY=0,bHidden=false,ActivateDelay=0.0000000,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    OutputLinks[0]=(Links=none,LinkDesc="Finished",bHasImpulse=false,bDisabled=false,bDisabledPIE=false,LinkedOp=none,ActivateDelay=0.0000000,DrawY=0,bHidden=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0,PIEActivationTime=0.0000000,bIsActivated=false)
    VariableLinks=none
    ObjName="Wait for Levels to be visible"
}