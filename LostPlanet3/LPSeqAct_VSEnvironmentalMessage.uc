class LPSeqAct_VSEnvironmentalMessage extends SequenceAction
    forcescriptorder(true)
    hidecategories(Object);

var(0.25_Pct) /*0x90540000-0x00000400*/ private editfixedsize @NULL MessageText[589825];
var(0.25_Pct) /*0x90540000-0x00000400*/ private editfixedsize @NULL SecondaryMessageText[589825];
var(0.25_Pct) /*0x90540000-0x00000000*/ private byte MessageType[65537];
var(0.25_Pct) /*0x47E20000-0x00000000*/ private float DisplayTimeSeconds[65537];
var(0.25_Pct) /*0x47E20000-0x00000000*/ private bool bDisplayFullMessageTextAsKismetComment[65537];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bCloseRequested;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bAborted;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bSuccessfullyDone;

defaultproperties
{
    // Reference: LPLocTextSelector'Default__LPSeqAct_VSEnvironmentalMessage.LPDefPropDSSelector'
    begin object name=LPDefPropDSSelector class=Class'LPLocTextSelector'
    end object
    MessageText=LPDefPropDSSelector
    // Reference: LPLocTextSelector'Default__LPSeqAct_VSEnvironmentalMessage.LPDefPropDSSelector2'
    begin object name=LPDefPropDSSelector2 class=Class'LPLocTextSelector'
    end object
    SecondaryMessageText=LPDefPropDSSelector2
    DisplayTimeSeconds=-1.0000000
    bLatentExecution=true
    InputLinks[0]=(LinkDesc="Open",bHasImpulse=false,QueuedActivations=0,bDisabled=false,bDisabledPIE=false,LinkedOp=none,DrawY=0,bHidden=false,ActivateDelay=0.0000000,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    InputLinks[1]=(LinkDesc="Close",bHasImpulse=false,QueuedActivations=0,bDisabled=false,bDisabledPIE=false,LinkedOp=none,DrawY=0,bHidden=false,ActivateDelay=0.0000000,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    OutputLinks[0]=(Links=none,LinkDesc="Out",bHasImpulse=false,bDisabled=false,bDisabledPIE=false,LinkedOp=none,ActivateDelay=0.0000000,DrawY=0,bHidden=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0,PIEActivationTime=0.0000000,bIsActivated=false)
    OutputLinks[1]=(Links=none,LinkDesc="Closed",bHasImpulse=false,bDisabled=false,bDisabledPIE=false,LinkedOp=none,ActivateDelay=0.0000000,DrawY=0,bHidden=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0,PIEActivationTime=0.0000000,bIsActivated=false)
    OutputLinks[2]=(Links=none,LinkDesc="Aborted",bHasImpulse=false,bDisabled=false,bDisabledPIE=false,LinkedOp=none,ActivateDelay=0.0000000,DrawY=0,bHidden=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0,PIEActivationTime=0.0000000,bIsActivated=false)
    OutputLinks[3]=(Links=none,LinkDesc="Done",bHasImpulse=false,bDisabled=false,bDisabledPIE=false,LinkedOp=none,ActivateDelay=0.0000000,DrawY=0,bHidden=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0,PIEActivationTime=0.0000000,bIsActivated=false)
    ObjName="VS Environmental Message (LP)"
    bSuppressAutoComment=false
}