class LPSeqAct_OpenFrontend extends SeqAct_Latent
    abstract
    forcescriptorder(true)
    hidecategories(Object);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL GFxFlashMovie;
var(0.25_Pct) /*0x82F00000-0x00000000*/ private class GFxFlashMovieInstanceClass_FrontEnd[65537];
var(0.25_Pct) /*0x82F00000-0x00000000*/ private bool bIsPreGameLobby[65537];
var(0.25_Pct) /*0x82F00000-0x00000000*/ private bool bIsMPMenu[65537];

defaultproperties
{
    InputLinks[0]=(LinkDesc="Open",bHasImpulse=false,QueuedActivations=0,bDisabled=false,bDisabledPIE=false,LinkedOp=none,DrawY=0,bHidden=false,ActivateDelay=0.0000000,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    OutputLinks[0]=(Links=none,LinkDesc="Done",bHasImpulse=false,bDisabled=false,bDisabledPIE=false,LinkedOp=none,ActivateDelay=0.0000000,DrawY=0,bHidden=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0,PIEActivationTime=0.0000000,bIsActivated=false)
    OutputLinks[1]=(Links=none,LinkDesc="Aborted",bHasImpulse=false,bDisabled=false,bDisabledPIE=false,LinkedOp=none,ActivateDelay=0.0000000,DrawY=0,bHidden=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0,PIEActivationTime=0.0000000,bIsActivated=false)
    ObjName="Open Frontend (LP)"
}