class LPSeqAct_ToggleTutorialMessages extends SeqAct_Toggle
    forcescriptorder(true)
    hidecategories(Object);

var(0.25_Pct) /*0x836B0000-0x00000000*/ private @NULL TutorialTimeDilationStartSound[65537];
var(0.25_Pct) /*0x836B0000-0x00000000*/ private editfixedsize array ModeTypes[65537];
var(0.25_Pct) /*0x836B0000-0x00000000*/ private bool bClearNotSelectedModes[65537];

defaultproperties
{
    ModeTypes=/* Array type was not detected. */
    InputLinks[0]=(LinkDesc="Show",bHasImpulse=false,QueuedActivations=0,bDisabled=false,bDisabledPIE=false,LinkedOp=none,DrawY=0,bHidden=false,ActivateDelay=0.0000000,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    InputLinks[1]=(LinkDesc="Hide",bHasImpulse=false,QueuedActivations=0,bDisabled=false,bDisabledPIE=false,LinkedOp=none,DrawY=0,bHidden=false,ActivateDelay=0.0000000,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    InputLinks[2]=(LinkDesc="Toggle",bHasImpulse=false,QueuedActivations=0,bDisabled=false,bDisabledPIE=false,LinkedOp=none,DrawY=0,bHidden=false,ActivateDelay=0.0000000,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    ObjName="Toggle Tutorial Messages (LP)"
}