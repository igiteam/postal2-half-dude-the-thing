class LPSeqAct_SetUnlockStatus extends SequenceAction
    forcescriptorder(true)
    hidecategories(Object);

var(0.25_Pct) /*0x833F0000-0x00000000*/ private name UnlockName[65537];
var(0.25_Pct) /*0x833F0000-0x00000000*/ private bool bSinglePlayer[65537];
var(0.25_Pct) /*0x833F0000-0x00000000*/ private bool bMultiplayer[65537];
var(0.25_Pct) /*0x833F0000-0x00000000*/ private bool bSaveAfterUnlock[65537];

defaultproperties
{
    bSinglePlayer=true
    bMultiplayer=true
    bSaveAfterUnlock=true
    InputLinks[0]=(LinkDesc="Unlocked",bHasImpulse=false,QueuedActivations=0,bDisabled=false,bDisabledPIE=false,LinkedOp=none,DrawY=0,bHidden=false,ActivateDelay=0.0000000,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    InputLinks[1]=(LinkDesc="Locked",bHasImpulse=false,QueuedActivations=0,bDisabled=false,bDisabledPIE=false,LinkedOp=none,DrawY=0,bHidden=false,ActivateDelay=0.0000000,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    ObjName="Set Unlock Status (LP)"
}