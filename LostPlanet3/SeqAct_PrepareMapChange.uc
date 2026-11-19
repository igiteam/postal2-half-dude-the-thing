class SeqAct_PrepareMapChange extends SeqAct_Latent
    hidecategories(Object);

var(*) /*0x441E0000-0x00000000*/ private name MainLevelName[65537];
var(*) /*0x441E0000-0x00000000*/ private editfixedsize array InitiallyLoadedSecondaryLevelNames[65537];
var(*) /*0x441E0000-0x00000000*/ private bool bIsHighPriority[65537];
var(*) /*0x35EA0000-0x00000000*/ private bool bStatusIsOk[536870913];

defaultproperties
{
    InputLinks[0]=(LinkDesc="PrepareLoad",bHasImpulse=false,QueuedActivations=0,bDisabled=false,bDisabledPIE=false,LinkedOp=none,DrawY=0,bHidden=false,ActivateDelay=0.0000000,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    OutputLinks[0]=(Links=none,LinkDesc="Finished",bHasImpulse=false,bDisabled=false,bDisabledPIE=false,LinkedOp=none,ActivateDelay=0.0000000,DrawY=0,bHidden=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0,PIEActivationTime=0.0000000,bIsActivated=false)
    VariableLinks=none
    ObjName="Prepare Map Change"
}